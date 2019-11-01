# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

pkgname=protondb-tags-dev-git
_pkgname=ProtonDB-Tags
pkgver=r51.fe599c4
pkgrel=1
pkgdesc="Pull ratings from ProtonDB and import them into your Steam library as tags."
arch=('any')
url="https://github.com/CorruptComputer/$_pkgname"
license=('MIT')
depends=(
    'python-vdf'
    'python-requests'
)
optdepends=(
    'steam: Supports any steam, native, flatpak, etc'
)
provides=('protondb-tags')
conflicts=('protondb-tags')
source=(git+https://github.com/CorruptComputer/$_pkgname.git#branch=dev)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_pkgname"
  
  install -Dm755 $_pkgname.py "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
