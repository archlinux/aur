# Maintainer: Adrien Wu <adrien.sf.wu@gmail.com>
pkgname=python2-pexpect
pkgver=4.8.0
pkgrel=1
pkgdesc="Pexpect allows easy control of interactive console applications."
url="https://pexpect.readthedocs.io/en/stable/"
arch=('any')
provides=('python2-pexpect')
depends=('python2' 'python2-ptyprocess')
makedepends=('python2-setuptools')
_name="${pkgname#python2-}"
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('fc65a43959d153d0114afe13997d439c22823a27cefceb5ff35c2178c6784c0c')

build() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
