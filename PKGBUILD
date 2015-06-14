# Maintainer: Christophe-Marie Duquesne <chmd@chmd.fr>

pkgname=netmon-git
pkgdesc="A lightweight tray network monitor useful with netctl"
url="http://github.com/chmduquesne/netmon"
depends=(
    'python2'
    'iproute2'
    'iputils'
    'wpa_supplicant'
    'pygtk')
makedepends=('git')
provides=('netmon')
license=('GPL')
arch=('any')
pkgver=0.r12.9b6a452
pkgrel=1
source=("$pkgname"::'git+http://github.com/chmduquesne/netmon.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm 755 netmon $pkgdir/usr/bin/netmon
}
