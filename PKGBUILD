# Maintainer: LinArcX <LinArcX at gmail dot com>

pkgname=tvdoon-git
pkgver=r3.69640c1
pkgrel=1
pkgdesc="Show Information About Tv Show's, Ratings And So Many Cool Fatures!"
arch=('any')
url="http://www.stack.blog.ir"
license=('GPL3')
depends=('python' 'python-setuptools')
makedepends=('git')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("${pkgname}::git+https://github.com/LinArcX/tvdoon")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname}"
		( set -o pipefail
			git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
			printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
		)
}

#build(){
#	cd "${srcdir}/${pkgname}"
#	python setup.py build
#}

package() {
	# install -d ${pkgdir}/usr/share/sirfiliams
	# cp -a ./sirfiliams.py  ${pkgdir}/usr/share/sirfiliams
	# cp -a ./setup.py ${pkgdir}
	# python setup.py install --root="$pkgdir/" --optimize=1
    
	cd "${srcdir}/${pkgname}"
	sudo python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
	# sudo python setup.py install --optimize=1
	# sudo python setup.py install --root="$pkgdir/" --optimize=1
	# make DESTDIR="$pkgdir/" install
}
