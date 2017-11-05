# Maintainer: Fabio Loli <loli_fabio@protonmail.com> -> https://github.com/FabioLolix

pkgname=mstreamexpress-bin
pkgver=0.4.3
pkgrel=1
pkgdesc="Music streaming server with Flac support, based on Electron"
arch=('x86_64')
url="http://www.mstream.io/"
license=('GPL3')
depends=('alsa-lib'
         'gtk2'
         'libxtst'
         'gconf'
         'libxss'
         'gcc-libs-multilib'
         'nss')
conflicts=('mstreamexpress')
replaces=('mstreamexpress')
source=("https://github.com/IrosTheBeggar/mStream/releases/download/v3.0.7/mstreamExpress-linux-v${pkgver}.tar.gz")
md5sums=('eb14e68bc67fe44ca7cbf209729c0c42')
PKGEXT='.pkg.tar'

package() {
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  mv ${srcdir}/mstreamExpress-v${pkgver}/{LICENSE,LICENSES.chromium.html} ${pkgdir}/usr/share/licenses/${pkgname}

  install -d ${pkgdir}/usr/share/${pkgname}
  cp -r ${srcdir}/mstreamExpress-v${pkgver}/* ${pkgdir}/usr/share/${pkgname}
  mv ${pkgdir}/usr/share/${pkgname}/mstreamExpress-v${pkgver} ${pkgdir}/usr/share/${pkgname}/mstreamexpress

  install -d ${pkgdir}/usr/bin
  ln -s /usr/share/${pkgname}/mstreamexpress ${pkgdir}/usr/bin/mstreamexpress
}
