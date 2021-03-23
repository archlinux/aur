# Maintainer: Matthew Stern <msstern98 gmail com>
# Maintainer: Ben Michalowicz <benjaminmichalowicz98 gmail com>

pkgname=python-topylogic
pkgbase=python-topylogic
pkgver=1.3.0.post3
pkgrel=1
pkgdesc='Library to create dyanimic context free or switching automata'
arch=('any')
url="https://github.com/mstern98/topologic-git"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')

_pyname=topylogic
_name=${_pyname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('ddfb79573144ac1a1c205f14585a7b7315702baabe37f98ff507e7821974a9d4')

build() 
{
    cd "$srcdir/$_pyname-$pkgver"
    python setup.py build
}

package()
{
    cd "$srcdir/$_pyname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
