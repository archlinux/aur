# Maintainer: xmlzitos154 <matheuz.ricardo@protonmail.com>
pkgname=jay-bin
pkgver=3.4.4
pkgrel=1.1
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
sha256sums=('0ec96f314f0393dc3ef4ff583ef4fc8cc309c9777883724b9e21131af24ea124')

package() {
    cd "jay-$pkgver"
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/jay/modules"
    install -dm755 "$pkgdir/usr/share/doc/jay"
    install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm755 main "$pkgdir/usr/bin/jay"
    for mod in modules/*; do
        install -Dm644 "$mod" "$pkgdir/usr/share/jay/$mod"
    done
    install -Dm644 README.md "$pkgdir/usr/share/doc/jay/README.md"
}
