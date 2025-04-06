# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Achmad Fathoni<fathoni.id(at)gmail.com>
# Contributor: ycatz <thesummernightcat@gmail.com>

pkgname="python-holidays"
_pkgname="${pkgname#python-}"
pkgver=0.69
pkgrel=1
pkgdesc="Generate and work with holidays in Python"
arch=("any")
url="https://github.com/vacanza/holidays"
license=("MIT")
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools")
depends=("python"
"python-convertdate"
"python-korean_lunar_calendar"
"python-hijri-converter")
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
b2sums=('0afab35785ff09edbe40c2c2dcdf18deaa8317ba29b2b504951e7115ffdac03ddd84702ecdcf14c91699e4c7a31e361b3437147c5f41f93d16b43d2c25a41a89')

build(){
 cd ${srcdir}/${_pkgname}-${pkgver}
 python -m build --wheel --no-isolation
}

package(){
 cd ${srcdir}/${_pkgname}-${pkgver}
 python -m installer --destdir="$pkgdir" dist/*.whl
}
