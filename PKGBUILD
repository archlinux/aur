pkgname=xlights
pkgver=2022.22
pkgrel=1
pkgdesc="xLights is a sequencer for Lights."
url="https://xlights.org/"
license=('GPL')
_bin="xLights-$pkgver-x86_64.AppImage"
source=(
    "https://github.com/smeighan/xLights/releases/download/$pkgver/$_bin"
    "xlights.desktop"
)
arch=('x86_64')
md5sums=(
    '8eed73261c469f80ea839f86a03380ab'
    'db5ba2bc1711d6517d819fad728b76b9'
)
provides=('xlights')
options=('!strip')

package() {
  install -Dm755 "${srcdir}/${_bin}" "${pkgdir}/opt/xlights/${_bin}"
  install -Dm644 "${srcdir}/xlights.desktop" "${pkgdir}/usr/share/applications/xlights.desktop"
  mkdir -p "${pkgdir}/usr/bin/"
  ln -s "/opt/xlights/${_bin}" "${pkgdir}/usr/bin/xlights"
}
