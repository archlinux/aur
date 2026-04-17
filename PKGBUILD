# Maintainer: xmlzitos154 <matheuz.ricardo@protonmail.com>
pkgname=jay-bin
pkgver=3.4.3
pkgrel=3.1
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
sha256sums=('1b56630668fc3a5ff24ee2c1497af9ff21f8a96a834d042409d59ea34c877de5')

package() {
    cd "$srcdir/jay-$pkgver"
    mkdir -p "$pkgdir/usr/share/jay"
    mkdir -p "$pkgdir/usr/bin"
    cp -dr --no-preserve=ownership modules "$pkgdir/usr/share/jay/"
    install -Dm755 main "$pkgdir/usr/bin/jay"
    install -Dm755 install.sh "$pkgdir/usr/share/jay/install.sh"
    install -Dm644 README.md "$pkgdir/usr/share/doc/jay/README.md"
}
