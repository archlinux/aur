# Maintainer: Echa <echa37 at proton dot me>
# Contributor: Vaargk <s30vm63qa at mozmail dot com>, Rucker <ruckeraur at proton dot me>

pkgname=obs-plugin-tuna-bin
pkgver=1.9.11
pkgrel=1
arch=(x86_64)
pkgdesc="Song information plugin for obs-studio"
url="https://github.com/univrsal/tuna"
license=('GPL2')
depends=("obs-studio")
provides=("obs-plugin-tuna=$pkgver")
conflicts=("obs-plugin-tuna" "obs-tuna")
source=("https://github.com/univrsal/tuna/releases/download/v$pkgver/tuna-$pkgver-x86_64-linux-gnu.deb")
sha256sums=('69cb119081f58fdd451053c7059a614119701e71fdd3b044a88c8bc0e3f7311d')

package() {
  bsdtar -xf ${srcdir}/data.tar.gz -C ${pkgdir}/
  cd ${pkgdir}/usr/lib/
  mv x86_64-linux-gnu/obs-plugins .
  rm -r x86_64-linux-gnu
  chown root:root -vR "${pkgdir}/"
}
