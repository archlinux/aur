# Maintainer: xmlzitos154 <matheuz.ricardo@protonmail.com>
pkgname=jay-bin
pkgver=7.4.1
pkgrel=1
pkgdesc="A lightweight, semantic AUR helper wrapper for Arch Linux"
arch=('any')
url="https://github.com/xmlzitos154/jay"
license=('MIT')
depends=('bash')
optdepends=(
    'flatpak: hybrid AUR/Flatpak mode'
    'reflector: mirror optimization support'
    'expac: system statistics'
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('a7cddd243860626577b804855aa4d38c62013341dc2132799765db4c620378e3')

package() {
    cd "jay-$pkgver"
    install -Dm755 main "$pkgdir/usr/bin/jay"
    install -Dm644 README.md "$pkgdir/usr/share/doc/jay/README.md"
    install -Dm644 languages/en.sh "$pkgdir/usr/share/jay/en.sh"
    install -Dm644 languages/pt.sh "$pkgdir/usr/share/jay/pt.sh"
    install -Dm644 modules/base.sh "$pkgdir/usr/share/jay/base.sh"
    install -Dm644 modules/logging.sh "$pkgdir/usr/share/jay/logging.sh"
    install -Dm644 modules/cache.sh "$pkgdir/usr/share/jay/cache.sh"
    install -Dm644 modules/flatpak.sh "$pkgdir/usr/share/jay/flatpak.sh"
    install -Dm644 modules/etc.sh "$pkgdir/usr/share/jay/etc.sh"
}
