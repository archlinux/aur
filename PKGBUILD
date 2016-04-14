# Maintainer: David Rodriguez <dissonant.tech@gmail.com>
pkgname=tee-clc
pkgver=11.0.0
pkgrel=1
epoch=
pkgdesc="Microsoft Visual Studio Team Explorer Everywhere 2012 - command-line client for Visual Studio 2012 Team Foundation Server"
arch=(i686 x86_64)
url="http://www.microsoft.com/en-us/download/details.aspx?id=30661"
license=('custom:microsoftSoftwareLicense')
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
source=(http://download.microsoft.com/download/4/2/7/427AC2CF-8A5B-4DE9-8221-22F54B1903E2/TEE-CLC-${pkgver}.1212.zip)
sha256sums=('d5b5fc31321a77581ad9848a0a37063b6ed982c8b242f8d08c81c5e969164608')

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
