# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=mstreamexpress-bin
pkgver=0.16
pkgrel=1
pkgdesc="Music streaming server with Flac support, based on Electron"
arch=(x86_64)
url="https://www.mstream.io/"
license=(GPL3)
depends=(alsa-lib gtk3 libxtst libxss nss)
conflicts=(mstreamexpress)
replaces=(mstreamexpress)
source=("mStreamExpress-$pkgver.tar.gz::https://github.com/IrosTheBeggar/mStream/releases/download/v4.2.1/mStreamExpress-Linux-X64.tar.gz")
md5sums=('01e4422e4cc2da831511da0a72f488bd')
PKGEXT='.pkg.tar'

package() {
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  mv ${srcdir}/mstreamExpress-linux-x64/{LICENSE,LICENSES.chromium.html} ${pkgdir}/usr/share/licenses/${pkgname}

  install -d ${pkgdir}/usr/share/${pkgname}
  cp -r ${srcdir}/mstreamExpress-linux-x64/* ${pkgdir}/usr/share/${pkgname}

  install -d ${pkgdir}/usr/bin
  ln -s /usr/share/${pkgname}/mstreamexpress ${pkgdir}/usr/bin/mstreamexpress
}
