# Maintainer: Tobias Bachmann <tobachmann@gmx.de>
pkgname=python-opengl-accelerate
pkgver=3.1.10
pkgrel=1
pkgdesc="This is the Cython-coded accelerator module for PyOpenGL 3.x"
_name=PyOpenGL-accelerate
__name=pyopengl_accelerate
arch=('any')
url="https://pypi.org/project/PyOpenGL-accelerate/"
license=('BSD')
groups=()
depends=('python' 'python-opengl' 'cython' 'python-numpy')
makedepends=(python-build python-installer python-wheel python-setuptools)
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
#source=("https://github.com/mcfletch/${_name}/archive/${_commit}.tar.gz")
source=($pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$__name-$pkgver.tar.gz)
sha256sums=('82751c83f0a6f732b8b5923990edc2441d38176a98756b1718e8d6c4379f5a71')

build() {
  cd "$srcdir/${__name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/${__name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}

# vim:set ts=2 sw=2 et:
