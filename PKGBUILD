# Maintainer: Matt Quintanilla <matt @ matt quintanilla . xyz>
# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Achmad Fathoni<fathoni.id(at)gmail.com>
# Contributor: ycatz <thesummernightcat@gmail.com>

pkgname="python-holidays"
_pkgname="${pkgname#python-}"
pkgver=0.108
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
b2sums=('d4a594e8c9cb6f44b1d69e78f81cb15253f65334c3887051d1c81d80d0431bdc53b698be6db07d44081ca09ae9ac3e8cd39842db50a4a01154cdda54f48ef48b')

build(){
 cd ${srcdir}/${_pkgname}-${pkgver}
 python -m build --wheel --no-isolation
}

package(){
 cd ${srcdir}/${_pkgname}-${pkgver}
 python -m installer --destdir="$pkgdir" dist/*.whl
}
