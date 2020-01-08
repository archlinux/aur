# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix

pkgname=headset-bin
pkgver=3.2.0
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
sha256sums_x86_64=('416f971be75cfc7c4cc887d96d0b4d2543d0ad13fb8fd6acfaa2f958baf796cb')
PKGEXT='.pkg.tar'

package() {
  bsdtar -xf ${srcdir}/data.tar.xz -C ${pkgdir}/
  install -Dm644 $pkgname-MIT ${pkgdir}/usr/share/licenses/${pkgname}/MIT
  mv ${pkgdir}/usr/lib/headset/LICENSES.chromium.html ${pkgdir}/usr/share/licenses/${pkgname}
  mv ${pkgdir}/usr/share/doc/headset/copyright ${pkgdir}/usr/share/licenses/${pkgname}
  rm -r ${pkgdir}/usr/share/{doc,lintian}
}
