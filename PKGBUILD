# Maintainer: Matthew Stern <msstern98 gmail com>
# Maintainer: Ben Michalowicz <benjaminmichalowicz98 gmail com>

pkgname=python-topylogic
pkgbase=python-topylogic
pkgver=1.4.4
pkgrel=1
pkgdesc='Library to create dyanimic context free or switching automata'
arch=('any')
url="https://github.com/mstern98/topylogic-git"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')

_pkgname=topylogic
_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('8355e457b2253e776d3230062e78392f59769d392eff84fc4e8a1b8692878839')

build() 
{
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py build
}

package()
{
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
