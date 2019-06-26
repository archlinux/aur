# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

pkgname=protondb-to-steam-library-git
_pkgname=ProtonDB-to-Steam-Library
pkgver=r35.64524da
pkgrel=2
pkgdesc="Pull ratings from ProtonDB and import them into your Steam library as tags."
arch=('any')
url="https://github.com/CorruptComputer/ProtonDB-to-Steam-Library"
license=('MIT')
depends=(
    'python-vdf'
)
source=(git+https://github.com/CorruptComputer/$_pkgname.git)
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
