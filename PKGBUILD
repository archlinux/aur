# Maintainer: Ayush Shenoy <masala_man@protonmail.com>

pkgname=base16-console
pkgver=1.0
pkgrel=1
pkgdesc="Base16 themes for the console and shell dialog"
url="https://github.com/masala-man/${pkgname}"
arch=('any')
license=('GPL')
depends=('systemd')
backup=('etc/systemd/system/getty@.service.d/base16-console.conf')
install="$pkgname.install"
source=("$pkgname"
        "$pkgname.conf"
        "$pkgname@.service"
        'dialogrc'
        'base16_themes.tar.gz'
        'base16consolerc')
sha256sums=('0ab6e6aeee2afa48de3cce227514e8b5dcdf3cb80abab8ed1d3b2ee656abf73d'
            '66aee44f5a4e5de336f06d2971ae06aa3aa7c6bbf21dab4bf264c2e9a52e95db'
            '7170139965a37e0b67928dd25445d2e3474c2f2fc32a6786025889c887427351'
            '18e6a369c2523da4f05607fd76e47ccf1fb3f2f32f5ba846fdf238aa0a7e7fea'
            '3cee8553d3d20ddb3663fe8840926dcdd6e50800ad8149e4244b5786c7de6f47'
            '0659477ee6d0dda1beb00dd30ef5a283d800ec4816e2b5b3b172d3d7368d8559')

package() {
    install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
    install -Dm644 $pkgname@.service "$pkgdir/etc/systemd/system/$pkgname@.service"
    install -Dm644 $pkgname.conf "$pkgdir/etc/systemd/system/getty@.service.d/$pkgname.conf"
    install -Dm644 base16consolerc "$pkgdir/etc/base16consolerc"
    install -Dm644 themes/* -t "$pkgdir/usr/share/$pkgname/themes"
#    install -Dm644 dialogrc $pkgdir/etc/skel/.dialogrc
}
