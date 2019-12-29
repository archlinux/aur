# Maintainer: Kaare Jenssen <kaare at jenssen dot it>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=stumpwm-contrib-git
pkgver=r280.0eeeca2
pkgrel=1
pkgdesc="Collection of StumpWM modules"
arch=('any')
url="https://github.com/stumpwm/stumpwm-contrib.git"
license=('GPL2')
depends=('bash' 'stumpwm')
makedepends=('git')
conflicts=('stumpwm-contrib')
provides=('stumpwm-contrib')
source=("git+https://github.com/stumpwm/stumpwm-contrib.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

package() {
  cd "${pkgname%-git}"
  _contribdest=/usr/share/stumpwm/contrib
  install -d $pkgdir/${_contribdest}
  cp -ra * $pkgdir/${_contribdest}
}
