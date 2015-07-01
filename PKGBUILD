# Maintainer: Alain Kalker <a.c.kalker@gmail.com>
_gitname=systemd-emergency-keyboard
pkgname=$_gitname-git
pkgver=v0.2.r0.ge7aec09
pkgrel=1
pkgdesc="Load keyboard drivers before entering systemd's Emergency mode"
arch=('any')
url="https://github.com/ackalker/systemd-emergency-keyboard"
license=('GPL')
makedepends=('git')
source=(git+https://github.com/ackalker/$_gitname.git)
md5sums=('SKIP')


pkgver() {
  cd "$srcdir/$_gitname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
