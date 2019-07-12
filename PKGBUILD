# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix

pkgname=headset-bin
pkgver=3.0.2
pkgrel=1
pkgdesc="An Electron-based music player for the busy ones"
arch=(x86_64)
url="https://headsetapp.co/"
license=(MIT)
depends=(gconf gtk3 nss libxss)
provides=(headset)
conflicts=(headset)
source_x86_64=("https://github.com/headsetapp/headset-electron/releases/download/v${pkgver}/headset_${pkgver}_amd64.deb")
source=("$pkgname-MIT::https://github.com/headsetapp/headset-electron/raw/master/LICENSE")
sha256sums=('0fd4183b7556b9f1b93d974969bad60053ab01db10ed2b501d26ed6840766045')
sha256sums_x86_64=('54c60bd7b7b14f4d70113fae7a19e0a3c217d87d3e5fd5de36fb89adaaba8bb3')
PKGEXT='.pkg.tar'

package() {
  bsdtar -xf ${srcdir}/data.tar.xz -C ${pkgdir}/
  install -Dm644 $pkgname-MIT ${pkgdir}/usr/share/licenses/${pkgname}/MIT
  mv ${pkgdir}/usr/lib/headset/LICENSES.chromium.html ${pkgdir}/usr/share/licenses/${pkgname}
  mv ${pkgdir}/usr/share/doc/headset/copyright ${pkgdir}/usr/share/licenses/${pkgname}
  rm -r ${pkgdir}/usr/share/{doc,lintian}
}
