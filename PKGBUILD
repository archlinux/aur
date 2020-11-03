# Maintainer: Linux Gamers <linuxgamers@protonmail.com>

pkgname=jslisten-git
pkgrel=1
pkgver=50ead3e
pkgdesc="This program listen in the background for gamepad inputs. If a special button combination is getting pressed, the provided command line will be invoked."
arch=('any')
provides=('jslisten')
conflicts=('jslisten')
url="https://github.com/workinghard/jslisten"
license=('GNU General Public License v3.0')
makedepends=('git' 'make')
sha256sums=('SKIP')
source=("git+${url}")

pkgver() {
  cd $srcdir/jslisten
  git log -1 --oneline | grep -Po "^\w+" 
}

build() {
  cd "${srcdir}/jslisten" && make
}

package() {
  mkdir -p $pkgdir/usr/bin
  cp "${srcdir}/jslisten/bin/jslisten" $pkgdir/usr/bin 
}
