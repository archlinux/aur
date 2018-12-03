# Maintainer: David Rodriguez <dissonant.tech@gmail.com>
pkgname=tee-clc
pkgver=14.114.0
pkgrel=1
epoch=
pkgdesc="Team Explorer Everywhere Plug-in for Eclipse and Cross-platform Command-line Client for Team Foundation Server"
arch=(i686 x86_64)
url="https://github.com/Microsoft/team-explorer-everywhere"
license=('MIT')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=install
changelog=
source=(https://github.com/Microsoft/team-explorer-everywhere/releases/download/v${pkgver}/TEE-CLC-${pkgver}.zip)
sha256sums=('af4b7123a09475ff03a3f5662df3de614df2f4acc33df16cdab307b5fb6d7dc7')

package() {
  cd "$srcdir/TEE-CLC-$pkgver"
  mkdir -p ${pkgdir}/opt/tee-clc-${pkgver}
  cp -R help lib tf tf.cmd ${pkgdir}/opt/tee-clc-${pkgver}
  mkdir -p ${pkgdir}/usr/share/licenses/tee-clc/
  cp -R license.html ${pkgdir}/usr/share/licenses/tee-clc/
  mkdir -p ${pkgdir}/opt/tee-clc-${pkgver}/native/linux/
  if [ $(uname -m) == "i686" ] ; then
    cp -R native/linux/x86 ${pkgdir}/opt/tee-clc-${pkgver}/native/linux/
  else
    cp -R native/linux/x86_64 ${pkgdir}/opt/tee-clc-${pkgver}/native/linux/
  fi
}

# vim:set ts=2 sw=2 et:
