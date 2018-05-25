# Maintainer: Rafal Malachowicz <k5hv@linux.pl>
# Based on gnome-shell-extension-gnomenu PKGBUILD maintained by: Scott Dickson <scottfoesho@gmail.com>

_pkgname=gnome-shell-extension-gnomenu
pkgname=$_pkgname-git
pkgver=25.r3.g24ba946
pkgrel=1
pkgdesc="GnoMenu - is a traditional styled full featured Gnome-Shell apps-menu, that aims to offer all the essentials in a simple uncluttered intuitive interface."
arch=('any')
url="https://github.com/The-Panacea-Projects/Gnomenu"
license=('GPL3')
depends=('gnome-shell')
makedepends=('git')
conflicts=($_pkgname)
source=('git+https://github.com/The-Panacea-Projects/Gnomenu')
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/Gnomenu"
  git describe --long | sed 's/^gno-menu.v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  _extname='gnomenu@panacier.gmail.com'

  cd "$srcdir/Gnomenu"
  rm README.md Screenshot.png

  install -d "$pkgdir/usr/share/gnome-shell/extensions/${_extname}"
  cp -r . "$pkgdir/usr/share/gnome-shell/extensions/${_extname}/"
}
