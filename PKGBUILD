# Maintainer: Antony Lee <anntzer dot lee at gmail dot com>

pkgname=python-vispy-git
pkgver=v0.3.0.r650.g6ee85e2
pkgrel=1
pkgdesc='A high-performance interactive 2D/3D data visualization library.'
arch=('any')
url='http://pypi.python.org/pypi/vispy/'
license=('BSD')
depends=('python-numpy')
optdepends=('python-glfw: a possible backend'
            'python-opengl: a possible backend'
            'python-pyglet: a possible backend'
            'python-pyqt4: a possible backend'
            'python-pysdl2: a possible backend'
            'python-pyside: a possible backend')
source=('git://github.com/vispy/vispy.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/vispy"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/vispy"
  python setup.py build
}

package() {
  cd "$srcdir/vispy"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

