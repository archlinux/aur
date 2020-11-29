# Maintainer: SanskritFritz (gmail)

pkgname=quikey-git
_gitname=quikey
pkgver=0.1.5.r0.gdb1e74b
pkgrel=1
pkgdesc="A keyboard macro tool."
arch=('any')
url="https://github.com/bostrt/quikey"
license=('MIT')
depends=('python-click' 'python-colored' 'python-daemon' 'python-inotify-simple' 'python-tinydb' 'python-pynput' 'python-terminaltables' 'python-xdg' 'python-humanize' 'python-pick' 'python-filelock')
makedepends=('python-setuptools')
provides=('quikey')
conflicts=('quikey')
source=("git+https://github.com/bostrt/quikey.git")
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$_gitname"
  python setup.py install --root=$pkgdir --optimize=1
}

# vim:set ts=2 sw=2 et:
