# Maintainer: 7k5x <7k5xlp0onfire@gmail.com>
# Contributor: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix

pkgname=headset-bin
pkgver=3.3.3
pkgrel=1
pkgdesc="An Electron-based music player for the busy ones"
arch=(x86_64)
url="https://headsetapp.co/"
license=(MIT)
depends=(gconf gtk3 nss libxss)
provides=(headset)
conflicts=(headset)
source_x86_64=("https://github.com/headsetapp/headset-electron/releases/download/v${pkgver}/headset_${pkgver}_amd64.deb")
source=("$pkgname-MIT::https://raw.githubusercontent.com/headsetapp/headset-electron/main/LICENSE")
sha256sums=('0fd4183b7556b9f1b93d974969bad60053ab01db10ed2b501d26ed6840766045')
sha256sums_x86_64=('b664dea7692b8707558de62f42a4036b891e62013c7a74670400706a4b979b66')

package() {
  bsdtar -xf ${srcdir}/data.tar.xz -C ${pkgdir}/
  install -Dm644 $pkgname-MIT ${pkgdir}/usr/share/licenses/${pkgname}/MIT
  mv ${pkgdir}/usr/lib/headset/LICENSES.chromium.html ${pkgdir}/usr/share/licenses/${pkgname}
  mv ${pkgdir}/usr/share/doc/headset/copyright ${pkgdir}/usr/share/licenses/${pkgname}
  rm -r ${pkgdir}/usr/share/{doc,lintian}
}
