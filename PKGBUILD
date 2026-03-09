# Maintainer: Matt Quintanilla <matt @ matt quintanilla . xyz>
# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Achmad Fathoni<fathoni.id(at)gmail.com>
# Contributor: ycatz <thesummernightcat@gmail.com>

pkgname="python-holidays"
_pkgname="${pkgname#python-}"
pkgver=0.92
pkgrel=1
pkgdesc="Generate and work with holidays in Python"
arch=("any")
url="https://github.com/vacanza/holidays"
license=("MIT")
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools")
depends=("python"
"python-convertdate"
"python-korean_lunar_calendar"
"python-hijridate")
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
b2sums=('4a607617ffdfe5dd9495601d97b0cf3a0387c0132001c9d207f80dda7fb6952513dbf61d9e18badf97c6a5d4b88f3bd3a3d1cf7cbbb843b3590c70a3e362aea5')

build(){
 cd ${srcdir}/${_pkgname}-${pkgver}
 python -m build --wheel --no-isolation
}

package(){
 cd ${srcdir}/${_pkgname}-${pkgver}
 python -m installer --destdir="$pkgdir" dist/*.whl
}
