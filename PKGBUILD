# Maintainer: Paulo Aquino <paulequilibrio at gmail dot com>
# Contributor: Paulo Aquino <paulequilibrio at gmail dot com>

pkgname=sway-switcher
pkgver=0.1.0
pkgrel=1
pkgdesc='Minimalist themeable window switcher for Sway'
arch=('any')
url='https://github.com/paulequilibrio/sway-switcher'
license=('MIT')
depends=('sway' 'gtk4' 'gtk4-layer-shell' 'python-gobject' 'python-yaml')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('965e88c23076f251457b95d5325dbafd86275f9c5e28cb58e745ce6f03feb3c1c3f9d781cee52e9bde43a92d2b3bd81fec71d870e54bb2f8e1ea981b6aa9aa0d')
install=$pkgname.install

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # Executable
    install -Dm755 ${pkgname}.py "$pkgdir/usr/bin/${pkgname}"

    # Reference stylesheet and configuration (users copy to ~/.config/sway-switcher/)
    install -Dm644 style.css \
        "$pkgdir/usr/share/$pkgname/style.css.example"
    install -Dm644 ${pkgname}.conf \
        "$pkgdir/usr/share/$pkgname/${pkgname}.conf.example"

    # Documentation
    install -Dm644 README.md \
        "$pkgdir/usr/share/doc/$pkgname/README.md"

    # Man page 
    install -Dm644 "${pkgname}.1" \
        "${pkgdir}/usr/share/man/man1/${pkgname}.1"

    # License
    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
