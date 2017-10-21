# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

_pkgname=polychromatic
pkgname=$_pkgname-git
pkgver=0.3.11.2.r1.gd572183
pkgrel=1
pkgdesc='A graphical front end for managing Razer peripherals under GNU/Linux.'
arch=('any')
license=('GPL2')
source=("git+https://github.com/lah7/polychromatic.git")
url='https://github.com/lah7/polychromatic'
makedepends=('git' 'nodejs-less')
depends=('python' 'hicolor-icon-theme' 'python-openrazer' 'webkit2gtk' 'libappindicator-gtk3' 'imagemagick')
provides=('polychromatic')
conflicts=('polychromatic')
sha512sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {  
  cd $srcdir/$_pkgname
  make DESTDIR=$pkgdir install
}

# vim:set ts=2 sw=2 et:
