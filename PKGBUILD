# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix

pkgname=headset-bin
pkgver=2.0.5
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
sha256sums=('721aa17f2b130970b6d149fa6373c4350118d85e46fae0820304af7317eb2405')
sha256sums_x86_64=('39c1348ff6ad5854ecba39e6c2279ba4e02a72f9e0aa423a6feb3c8d62c2027c')
PKGEXT='.pkg.tar'

package() {
  bsdtar -xf ${srcdir}/data.tar.xz -C ${pkgdir}/
  install -Dm644 $pkgname-MIT ${pkgdir}/usr/share/licenses/${pkgname}/MIT
  mv ${pkgdir}/usr/lib/headset/LICENSES.chromium.html ${pkgdir}/usr/share/licenses/${pkgname}
  mv ${pkgdir}/usr/share/doc/headset/copyright ${pkgdir}/usr/share/licenses/${pkgname}
  rm -r ${pkgdir}/usr/share/{doc,lintian}
}
