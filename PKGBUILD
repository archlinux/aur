# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=stumpwm-contrib-git
pkgver=r136.6af0e64
pkgrel=1
pkgdesc="Contribution resotiry for stumpwm"
arch=('any')
url="https://github.com/stumpwm/stumpwm-contrib.git"
license=('GPL2')
depends=('bash' 'stumpwm')
makedepends=('git')
conflicts=('stumpwm-git')
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
