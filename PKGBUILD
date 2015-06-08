# Maintainer: Robert Orzanna <orschiro@gmail.com>

pkgname=lightson-git
pkgver=r22.143e3f9
pkgrel=1
pkgdesc="Bash script that prevents the screensaver and display power # management (DPMS) to be activated when you are watching Flash Videos fullscreen."
arch=('i686' 'x86_64')
url="https://github.com/drhoet/lightsOn"
license=('GPL2')
depends=('xorg-xvinfo' 'xorg-xprop')
makedepends=('git')
source=("$pkgname"::'git://github.com/drhoet/lightsOn.git')
#source=('git+https://github.com/pschmitt/vol.sh.git'
#source=('git+https://github.com/pschmitt/vol.sh.git#branch=master'
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "$srcdir/$pkgname/lightsOn.sh" "$pkgdir/usr/bin/lightsOn"
}
