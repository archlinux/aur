# Maintainer: Andre Kugland <kugland@gmail.com>

pkgname="python-srt"
_name=${pkgname#python-}
pkgver=3.5.0
pkgrel=1
pkgdesc='A tiny library for parsing, modifying, and composing SRT files'
arch=('any')
url="https://pypi.org/project/$_name/$pkgver"
license=('MIT')
provides=('python-srt')
conflicts=('python-pysrt')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('9378e67fcc7c110eca7ec12bdb17a174085f67e3b371f7e586a4c68a0dda245b')

build() {
	cd ${srcdir}/${_name}-${pkgver}
    python setup.py build
}

package() {
	cd ${srcdir}/${_name}-${pkgver}  
    python setup.py install --root="${pkgdir}" --optimize=1
}
