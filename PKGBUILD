# Maintainer: chaostypos <chaostypos@gmail.com>

pkgname=twincan
_pkgname=TwinCAN
pkgver=1.0.0
pkgrel=1
pkgdesc='DBC compare Tool'
arch=('any')
url='https://github.com/JP-Makers/'
license=('MIT')
depends=("qt6-base")
provides=($pkgname)
conflicts=($pkgname)
source=("$_pkgname.tar.gz::https://github.com/JP-Makers/$_pkgname/releases/download/v$pkgver/$_pkgname.tar.gz")
sha256sums=('a31c61e733ae21eaa645de0e870c03d4fdb812c7e5a0a5666ef229ceba7fa8f4')

pkgver() {
  curl -s "https://api.github.com/repos/JP-Makers/$_pkgname/releases/latest" |
    grep -Po '"tag_name": "v\K[0-9.]+'
}

package() {
    cd $_pkgname
    install -vDm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname/"
    install -Dm644 "$_pkgname.desktop" -t "$pkgdir/usr/share/applications/"
    install -Dm644 "$_pkgname.svg" -t "$pkgdir/usr/share/icons/$_pkgname/"
    install -Dm755 "$_pkgname" -t "$pkgdir/usr/bin/"
}
