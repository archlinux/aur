# Maintainer: xmlzitos154 <matheuz.ricardo@protonmail.com>
pkgname=jay-bin
pkgver=3.3.7
pkgrel=1
pkgdesc="A lightweight, semantic AUR helper wrapper for Arch Linux"
arch=('any')
url="https://github.com/xmlzitos154/jay"
license=('MIT')
depends=('yay' 'bash')
optdepends=(
    'flatpak: hybrid AUR/Flatpak mode'
    'reflector: mirror optimization support'
    'checkupdates: check available updates'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('2bd5375e1807a75c4818afba5f063ec1f9f0a561027e7b3a1cf3061669b5aa92')

package() {
    cd "$srcdir/jay-$pkgver"
    install -Dm755 main "$pkgdir/usr/bin/jay"
    install -Dm755 install.sh "$pkgdir/usr/share/jay/install.sh"
    install -Dm644 modules/base "$pkgdir/usr/share/jay/modules/base"
    install -Dm644 modules/log "$pkgdir/usr/share/jay/modules/log"
    install -Dm644 modules/cache "$pkgdir/usr/share/jay/modules/cache"
    install -Dm644 modules/search "$pkgdir/usr/share/jay/modules/search"
    install -Dm644 modules/extra "$pkgdir/usr/share/jay/modules/extra"
    install -Dm644 README.md "$pkgdir/usr/share/doc/jay/README.md"
}
