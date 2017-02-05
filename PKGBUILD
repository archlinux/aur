# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Gerardo Marset <gammer1994@gmail.com>
# Contributor: Aaron Lindsay <aerial9@gmail.com>
# Contributor: Vithon <ratm@archlinux.us>
# Contributor: Alain

pkgname=dswifi
pkgver=0.4.0
pkgrel=1
pkgdesc="Library for using the wireless capabilities of the Nintendo DS for homebrew development"
license=('custom')
arch=('any')
url="http://www.akkit.org/dswifi/"
depends=('libnds')
source=("http://downloads.sourceforge.net/sourceforge/devkitpro/$pkgname-src-$pkgver.tar.bz2")
sha256sums=('042d0d353ab16efd2f24faf3bf9f4185ec6c5a324c388c779b9f49be398b2535')
options=(!strip libtool staticlibs)

build() {
  # set environment
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
