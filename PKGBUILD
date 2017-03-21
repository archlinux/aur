# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
pkgname=signa-browser-ext
r=7605
d=2017-03-17
pkgver=1.0.r${r}.${d//-}
pkgrel=1
pkgdesc="Native helper for web login using Lithuanian identity cards (for SoDra, VMI, &c)"
arch=(any)
license=('custom:¯\_(ツ)_/¯')
depends=(jre8-openjdk)
source=("https://www.mitsoft.lt/sites/mitsoft/files/SignaBrowserExt_r${r}_${d}_Linux.zip")
sha256sums=('d9e4d30da3b3375fd26302ac389f417feac0bcbf04b79b4a0fbe45f2a437116b')

prepare() {
  rm -rf */
  bsdtar xf "signa-browser-ext-1.0-r${r}-${d//-}-noarch.rpm"
}

build() {
  jre_dir="/usr/lib/jvm/java-8-openjdk/jre"
  #jre_dir="/usr/lib/jvm/default-runtime"
  sed -i "s|^java=.*|java='$jre_dir/bin/java'|" opt/signa-browser-ext/java
}

package() {
  cp -av usr/ opt/ "$pkgdir"/
}

# vim: ts=2:sw=2:et
