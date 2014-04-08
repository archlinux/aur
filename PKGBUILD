# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: Gerardo Marset <gammer1994@gmail.com>
# Contributor: Aaron Lindsay <aerial9@gmail.com>
# Contributor: Vithon <ratm@archlinux.us>
# Contributor: Alain

pkgname=dswifi
pkgver=0.3.16
pkgrel=1
pkgdesc="Library for using the wireless capabilities of the Nintendo DS for homebrew development"
license=('custom')
arch=('any')
url="http://www.akkit.org/dswifi/"
depends=('libnds')
source=("http://downloads.sourceforge.net/sourceforge/devkitpro/$pkgname-src-$pkgver.tar.bz2")
sha256sums=('5602a0c2840a95020ff6113ec982bfdbc7c3d4466b94d0c8f9026c7d4b636b33')
options=(!strip libtool staticlibs)

build() {
  source /etc/profile.d/devkitarm.sh

  make
}

package() {
  export DEVKITPRO="$pkgdir/opt/devkitpro"

  install -d "$DEVKITPRO/libnds"
  make install
  # license
  install -Dm644 dswifi_license.txt "$pkgdir"/usr/share/licenses/dswifi/dswifi_license.txt
}
