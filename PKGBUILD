# Contributor: Patrick Mischke

pkgname='python-glumpy'
_name='glumpy'
pkgver=1.2.0
pkgrel=4
pkgdesc="python library for scientific visualization, interfacing numpy and OpenGL"
url="https://github.com/glumpy/glumpy"
depends=('cython' 'python-numpy' 'python-triangle' 'python-opengl')
license=('BSD')
arch=('any')
#source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
#source=("https://github.com/glumpy/glumpy/archive/refs/tags/1.2.0.tar.gz")
#sha256sums=('83df6f1a465d5d32332b87cbda89a2664b136e15f252e09e66220a2e43801460') 
source=("https://github.com/glumpy/glumpy/archive/refs/heads/master.zip")
sha256sums=('SKIP')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
