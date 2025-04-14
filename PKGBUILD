# Maintainer: Matt Quintanilla <matt @ matt quintanilla . xyz>
# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Achmad Fathoni<fathoni.id(at)gmail.com>
# Contributor: ycatz <thesummernightcat@gmail.com>

pkgname="python-holidays"
_pkgname="${pkgname#python-}"
pkgver=0.70
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
b2sums=('323a72c9f693ab116868761b2419ed4b5674c583333901efeb36186650867b6c956593907bf7fa3bfda570032cef30cd7a3513758a63244cbdbe718d93b92401')

build(){
 cd ${srcdir}/${_pkgname}-${pkgver}
 python -m build --wheel --no-isolation
}

package(){
 cd ${srcdir}/${_pkgname}-${pkgver}
 python -m installer --destdir="$pkgdir" dist/*.whl
}
