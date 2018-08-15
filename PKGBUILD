# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix

pkgname=headset-bin
pkgver=2.0.1
pkgrel=1
pkgdesc="An Electron-based music player for the busy ones"
arch=(x86_64)
url="https://headsetapp.co/"
license=(MIT)
depends=(gconf gtk3 nss libxss)
provides=(headset)
conflicts=(headset)
source=("https://github.com/headsetapp/headset-electron/releases/download/v${pkgver}/headset_${pkgver}_amd64.deb"
        "MIT::https://github.com/headsetapp/headset-electron/raw/master/LICENSE")
md5sums=('dd802476ffe47029ae5343ccc0880e96'
         '4b21e50f5ba66d18a93fab87d11d67e0')
PKGEXT='.pkg.tar'

package() {
  bsdtar -xf ${srcdir}/data.tar.xz -C ${pkgdir}/
  install -Dm644 MIT ${pkgdir}/usr/share/licenses/${pkgname}/MIT
  mv ${pkgdir}/usr/lib/headset/LICENSES.chromium.html ${pkgdir}/usr/share/licenses/${pkgname}
  mv ${pkgdir}/usr/share/doc/headset/copyright ${pkgdir}/usr/share/licenses/${pkgname}
  rm -r ${pkgdir}/usr/share/{doc,lintian}
}
