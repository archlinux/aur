# Maintainer: Rucker <ruckeraur@proton.me>
# Contributor: Vaargk <s30vm63qa@mozmail.com>

pkgname=obs-plugin-tuna-bin
pkgver=1.9.8
pkgrel=1
arch=(x86_64)
pkgdesc="Song information plugin for obs-studio"
url="https://github.com/univrsal/tuna"
license=('GPL2')
depends=("obs-studio")
provides=("obs-plugin-tuna=$pkgver")
conflicts=("obs-plugin-tuna" "obs-plugin-tuna-git" "obs-tuna")
source=("https://github.com/univrsal/tuna/releases/download/v$pkgver/tuna-$pkgver-x86_64-linux-gnu.deb")
sha256sums=('a20d35cc765c64e39ddb8d2c3d35950aca854c581c46a8a79ff82f024c0e6d47')

package() {
  bsdtar -xf ${srcdir}/data.tar.gz -C ${pkgdir}/
  cd ${pkgdir}/usr/lib/
  mv x86_64-linux-gnu/obs-plugins .
  rm -r x86_64-linux-gnu
  chown root:root -vR "${pkgdir}/"
}
