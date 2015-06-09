# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/Python_Package_Guidelines for more
# information on Python packaging.

# Maintainer: Your Name <youremail@domain.com>
pkgname=python2-wssh-git
pkgver=r42.91b3b9c
pkgrel=1
pkgdesc="A command-line utility/shell for WebSocket inspired by netcat"
arch=('i686' 'x86_64')
url="https://github.com/progrium/wssh"
license=('MIT')
depends=('python2' 'python2-gevent' 'python2-ws4py')
options=(!emptydirs)
source=('wssh::git+https://github.com/progrium/wssh.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir"/wssh
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/wssh"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
