# Maintainer: robertfoster

pkgname=jackeventcmd-git
pkgver=3.eca961e
pkgrel=1
pkgdesc="Run custom commands when headphones are (un)plugged"
arch=('i686' 'x86_64')
url="https://github.com/gentoo-root/jackeventcmd"
license=('GPL3')
provides=('jackeventcmd')
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
