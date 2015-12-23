# Maintainer: acgtyrant <acgtyrant@gmail.com>
_pkgname=search-and-view
pkgname=${_pkgname}-git
pkgver=r12.df55f03
pkgrel=1
pkgdesc="Tools to make searching and viewing easy."
arch=('any')
url="https://github.com/lilydjwg/search-and-view"
license=('GPL3')
depends=('bash' 'the_silver_searcher' 'python' 'python-easygui' 'vim')
makedepends=('git')
optdepends=('python-setproctitle: agv support')
source=('git+https://github.com/lilydjwg/search-and-view.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${_pkgname}"
        install -Dm 755 agg "${pkgdir}/usr/bin/agg"
        install -Dm 755 agv "${pkgdir}/usr/bin/agv"
        install -Dm 755 vv "${pkgdir}/usr/bin/vv"
}
