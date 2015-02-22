# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Gerardo Marset <gammer1994@gmail.com>
# Contributor: Aaron Lindsay <aerial9@gmail.com>
# Contributor: Vithon <ratm@archlinux.us>
# Contributor: Alain

pkgname=dswifi
pkgver=0.3.17
pkgrel=1
pkgdesc="Library for using the wireless capabilities of the Nintendo DS for homebrew development"
license=('custom')
arch=('any')
url="http://www.akkit.org/dswifi/"
depends=('libnds')
source=("http://downloads.sourceforge.net/sourceforge/devkitpro/$pkgname-src-$pkgver.tar.bz2")
sha256sums=('a39d1cf0ec69e2372f34e9580d85335ee4189a9635862a78c0a0b87cf9c226c9')
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
