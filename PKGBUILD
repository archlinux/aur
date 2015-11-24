# Maintainer: Michael Corrigan <ghost.vonage AT gmail DOT com>
# Upstream URL: https://duck.sh/

pkgname=duck
pkgver=4.8.18546
pkgrel=2
pkgdesc="Cyberduck CLI"
PKGEXT='.pkg.tar'
arch=('x86_64' 'i686')
license=('GPL')
options=(!strip)
url="https://duck.sh/"
install=$pkgname.install
makedepends=('rpmextract')
depends=('java-runtime')
md5sums_x86_64=('83f3bcf56d259020ae70590343f4a031')
md5sums_i686=('20d63d3cc803d5b3aa38463daed1873e')
source_x86_64=("https://dist.duck.sh/duck-${pkgver}.x86_64.rpm")
source_i686=("https://dist.duck.sh/duck-${pkgver}.i686.rpm")

package() {
  rpmextract.sh *
  chmod -R g-w opt
  mv opt "${pkgdir}"
  mkdir -p "${pkgdir}/usr/bin"
  ln -s /opt/duck/duck "${pkgdir}/usr/bin/duck"
}
