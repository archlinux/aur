# Maintainer: Andrew Crerar <crerar@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Hideaki Takahashi <mymelo+aur@gmail.com>
# Contributor: Vincent Demeester <vincent@sbr.pm>

pkgname=python-dockerpty
pkgver=0.4.1
pkgrel=4
pkgdesc="Python library to use the pseudo-tty of a docker container"
arch=('any')
license=('Apache')
url="https://github.com/d11wtq/dockerpty"
depends=('python-docker-py' 'python-six')
makedepends=('python-setuptools' 'python-docker-py' 'python-six' 'git')
checkdepends=('python-pytest' 'python-expects')
source=("git+https://github.com/d11wtq/dockerpty.git#tag=v$pkgver")
sha512sums=('SKIP')

build() {
  cd "$srcdir/dockerpty"
  python setup.py build
}

check() {
  cd "$srcdir/dockerpty"
  py.test
}

package() {
  cd dockerpty
  python setup.py install --root="${pkgdir}" --optimize=1
}
