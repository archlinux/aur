# Maintainer: Matt Quintanilla <matt @ matt quintanilla . xyz>
# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Achmad Fathoni<fathoni.id(at)gmail.com>
# Contributor: ycatz <thesummernightcat@gmail.com>

pkgname="python-holidays"
_pkgname="${pkgname#python-}"
pkgver=0.107
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
b2sums=('2df6b7fc4ce6bc7650d2b806476cb5bb932bb6dbad211437f92a9734ca26b3bf95cf2d70d886cab9173d9342fe1c52f7b1bc2a3d0198dd85c9dba3d629cdb68a')

build(){
 cd ${srcdir}/${_pkgname}-${pkgver}
 python -m build --wheel --no-isolation
}

package(){
 cd ${srcdir}/${_pkgname}-${pkgver}
 python -m installer --destdir="$pkgdir" dist/*.whl
}
