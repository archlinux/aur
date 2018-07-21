# Maintainer: Robert Stoffers <rstoffers@gmail.com>

_pkgname=lcurse
pkgname=${_pkgname}-git
pkgver=1
pkgrel=2
pkgdesc="Curse-compatible addon update client for World of Warcraft. Use https://www.curseforge.com/wow/addons to obtain URLs for addons."
arch=('any')
url="https://github.com/ephraim/lcurse"
license=('Unlicense')
depends=('python' 'python-beautifulsoup4' 'python-pyqt5' 'python-lxml')
makedepends=('git')
provides=("${_pkgname}")
source=('git+https://github.com/ephraim/lcurse.git')
md5sums=('SKIP')

build() {
    cd "$srcdir/${_pkgname}"  
	python setup.py build
}

package() {
    cd "$srcdir/${_pkgname}"

    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

