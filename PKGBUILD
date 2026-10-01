# Maintainer: robertfoster

pkgname=jackeventcmd-git
pkgver=3.eca961e
pkgrel=1
pkgdesc="Run custom commands when headphones are (un)plugged"
arch=('x86_64')
url="https://github.com/gentoo-root/jackeventcmd"
license=('GPL-3.0-or-later')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
depends=('dbus' 'jacklistener')
makedepends=('git')
source=('jackeventcmd::git+https://github.com/gentoo-root/jackeventcmd')

build() {
  cd jackeventcmd
  make
}

package() {
  cd jackeventcmd
  make DESTDIR="$pkgdir" install
}

pkgver() {
  cd jackeventcmd
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

sha256sums=('SKIP')
