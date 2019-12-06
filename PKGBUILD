# Contributor: Denis 'GNUtoo' Carikli <GNUtoo@cyberdimension.org>
pkgname=python-bundlewrap
_pkgname=bundlewrap
pkgver=3.7.0
pkgrel=1
pkgdesc="Agent-less configuration management"
arch=('any')
url='https://bundlewrap.org/'
license=('GPL3')
depends=('python-cryptography'
	 'python-jinja'
	 'python-mako'
	 'python-passlib'
	 'python-pyaml'
	 'python-requests'
	 'python-six')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('3e6557dcb18f248dbf3384d73e75eeb1673601cd26a1797df3c570bff0197c81')

build(){
  cd "$srcdir/bundlewrap-$pkgver"
  python3 setup.py build
}

package(){
  cd "$srcdir/bundlewrap-$pkgver"
  python3 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
