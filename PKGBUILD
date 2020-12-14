# Maintainer: Andre Kugland <kugland@gmail.com>

pkgname="python-srt"
_name=${pkgname#python-}
pkgver=3.4.1
pkgrel=1
pkgdesc='A tiny library for parsing, modifying, and composing SRT files'
arch=('any')
url="https://pypi.org/project/$_name/$pkgver"
license=('MIT')
provides=('python-srt')
conflicts=('python-pysrt')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('aa507439bf593adb1b207d21c5975c9774263da97489f8b90d8a016bfa67ee94')

build() {
	cd ${srcdir}/${_name}-${pkgver}
    python setup.py build
}

package() {
	cd ${srcdir}/${_name}-${pkgver}
    
    python setup.py install --root="${pkgdir}" --optimize=1
}
 
