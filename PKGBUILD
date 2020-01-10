# Maintainer: jwhendy <jw.hendy@gmail.com>
# Contributor: bchretien
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: jepaan <jepaan at hotmail dot com>

pkgname=python-pyassimp
_name=assimp
pkgver=5.0.0
pkgrel=2
pkgdesc="Portable Open Source library to import various well-known 3D model formats in an uniform manner. Python bindings."
arch=('i686' 'x86_64')
license=('BSD')
depends=('assimp' 'python>=3')
url='http://assimp.sourceforge.net/index.html'
source=("https://github.com/assimp/assimp/archive/v${pkgver}.tar.gz")
sha256sums=('b0110a91650d6bb4000e3d5c2185bf77b0ff0a2e7a284bc2c4af81b33988b63c')
conflicts=(python2-pyassimp)

build()
{
  cd ${srcdir}/${_name}-${pkgver}/port/PyAssimp
  python3 setup.py build
}

package()
{
  cd ${srcdir}/${_name}-${pkgver}/port/PyAssimp
  python3 setup.py install --root="$pkgdir/" --optimize=1
}
