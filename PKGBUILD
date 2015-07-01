# Maintainer: Alain Kalker <a.c.kalker@gmail.com>
_gitname=mkinitcpio-systemd-ng
pkgname=$_gitname-git
pkgver=v0.2.r0.g1680383
pkgrel=1
pkgdesc="An improved, enhanced systemd hook for mkinitcpio"
arch=('any')
url="https://github.com/ackalker/mkinitcpio-systemd-ng"
license=('GPL')
makedepends=('git')
optdepends=('systemd-emergency-keyboard-git: Load keyboard drivers before entering Emergency mode')
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
