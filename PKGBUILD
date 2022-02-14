# Maintainer: Maurice Panchaud <github at mauricepanchaud dot com>
_pkgbasename=switchtube-dl

options=(!strip) # Otherwise all libraries will be stripped from the executable file

pkgname=$_pkgbasename-bin
pkgver=0.0.2
pkgrel=1 # Increment when PKGBUILD is changed
pkgdesc="Simple CLI for downloading videos from SwitchTube"
arch=('x86_64')
url="https://github.com/panmau/switchtube-dl"
license=('MIT')
depends=('gcc-libs' 'zlib')
makedepends=()
provides=('switchtube-dl')
source=("$pkgname-$pkgver.tar.gz::https://github.com/panmau/switchtube-dl/releases/download/$pkgver/$_pkgbasename.$pkgver.linux-x64.tar.gz")
sha256sums=('SKIP')

package() {
    mkdir -p "$pkgdir/usr/share"
    install -Dm755 -t "$pkgdir/usr/bin" \
        $_pkgbasename
    install -Dm644 ./LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 ./README.md \
        "$pkgdir/usr/share/doc/$pkgname/README.md"
}
