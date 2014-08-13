# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: jepaan <jepaan at hotmail dot com>

pkgname=python2-pyassimp
_name=assimp
pkgver=3.1.1
pkgrel=1
pkgdesc="Portable Open Source library to import various well-known 3D model formats in an uniform manner. Python bindings."
arch=('i686' 'x86_64')
license=('BSD')
depends=('assimp' 'python2')
url=('http://assimp.sourceforge.net/index.html')
source=("https://github.com/assimp/assimp/archive/v${pkgver}.tar.gz")
md5sums=('ab9977edf95e9b2910d7cca286926e85')

build()
{
  cd ${srcdir}/${_name}-${pkgver}/port/PyAssimp
  python2 setup.py build
}

package()
{
  cd ${srcdir}/${_name}-${pkgver}/port/PyAssimp
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
