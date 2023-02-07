# Maintainer: Vaargk <s30vm63qa@mozmail.com>
pkgname=obs-plugin-tuna-bin
pkgver=1.9.3
pkgrel=1
arch=(x86_64)
pkgdesc="Song information plugin for obs-studio"
url="https://github.com/univrsal/tuna"
license=('GPL2')
depends=("obs-studio")
provides=("obs-plugin-tuna=$pkgver")
conflicts=("obs-plugin-tuna" "obs-plugin-tuna-git" "obs-tuna")
source=("https://github.com/univrsal/tuna/releases/download/v$pkgver/tuna-$pkgver-linux-x86_64.deb")
sha256sums=('f74e4597c1803b0518ea228eadbb7c70800921f182240d8078adc2f4f77bd7b2')

package() {
  bsdtar -xf ${srcdir}/data.tar.gz -C ${pkgdir}/
  cd ${pkgdir}/usr/lib/
  mv x86_64-linux-gnu/obs-plugins .
  rm -r x86_64-linux-gnu
  chown root:root -vR "${pkgdir}/"
}