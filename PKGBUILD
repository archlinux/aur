# Maintainer: Nebula_Neko <chfsefefgesfen#foxmail>
# Contributor: acgtyrant <acgtyrant#gmail>

_pkgname=search-and-view
pkgname=$_pkgname-git
pkgver=r36.bad61fa
pkgrel=2
pkgdesc="Tools to make searching and viewing easy."
arch=('any')
url="https://github.com/lilydjwg/search-and-view"
license=('GPL3')
depends=('bash' 'python')
makedepends=('git')
optdepends=('python-setproctitle: agv support' 'ripgrep: rgg support' 'the_silver_searcher: agg support' 'vim: vv support')
source=('git+https://github.com/lilydjwg/search-and-view.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${_pkgname}"
  install -Dm 755 agg "$pkgdir/usr/bin/agg"
  install -Dm 755 agv "$pkgdir/usr/bin/agv"
  install -Dm 755 rgg "$pkgdir/usr/bin/rgg"
  install -Dm 755 agv "$pkgdir/usr/bin/rgv"
  install -Dm 755 vv "$pkgdir/usr/bin/vv"
}
