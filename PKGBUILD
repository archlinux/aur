pkgname=ganache
pkgver=1.1.0
_pkgver=1.1.0
pkgrel=1
pkgdesc='A local Ethereum blockchain'
url='http://truffleframework.com/ganache/'
arch=('any')
license=('MIT')
source=("https://github.com/trufflesuite/ganache/releases/download/v${_pkgver}/ganache-${_pkgver}-x86_64.AppImage"
"appimagekit-Ganache.desktop"
)
sha256sums=('57bbd55bccf2f74462e89f8096f550335bc748b039f068ed7b48584084ad7dfb'
SKIP
)
noextract=('ganache-${_pkgver}-x86_64.AppImage')
provides=('ganache')
options=('!strip')

package() {
  install -D -m 644 "${srcdir}/ganache-${_pkgver}-x86_64.AppImage" "${pkgdir}/usr/bin/ganache"
  install -D -m 644 "${srcdir}/appimagekit-Ganache.desktop" "${pkgdir}/usr/share/applications/appimagekit-Ganache.desktop"
  chmod +x "${pkgdir}/usr/bin/ganache"
}

