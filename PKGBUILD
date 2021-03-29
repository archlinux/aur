# Maintainer: Matthew Stern <msstern98 gmail com>
# Maintainer: Ben Michalowicz <benjaminmichalowicz98 gmail com>

pkgname=python-topylogic
pkgbase=python-topylogic
pkgver=1.4.3.post1
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
sha256sums=('30cee68d44c842a43661227a798fa5467edde25b4206878fdf44562cc9c407d9')

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
