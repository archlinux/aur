# Maintainer: Kevin Puertas <kevinpr@jkanetwork.com>
# Co-Maintainer: Eric Engestrom <arch.aur@engestrom.ch>
# Helper: paulequilibrio
pkgname=gdevelop-bin
_pkgname=gdevelop
pkgver=5.1.153
pkgrel=1
pkgdesc="Open-source, cross-platform game creator designed to be used by everyone - no programming skills required."
arch=('x86_64')
url='https://gdevelop-app.com/'
license=('GPL' 'MIT' 'zlib/png')
groups=()
provides=('gdevelop')
conflicts=('gdevelop')
source=("https://github.com/4ian/GDevelop/releases/download/v${pkgver//.b/-b}/GDevelop-${pkgver%%.*}-${pkgver//.b/-b}.AppImage"
        'https://github.com/4ian/GDevelop/raw/master/Core/docs/images/glogo.png'
        'gdevelop.desktop')
sha256sums=('5be98afdf6d28cdc61461fe665b1501a003221eee0636f765c5b8f749c4d4c5c'
            '6ec8974d1c073442e1e653ac75d8ab4c1ed1cc1c2d14c6d73d6c50543a4f4b5f'
            'd6074b92d0e5896a33cc007fa59eb35759569047b3a31d35108134beb538e039')
options=('!strip')

package() {
  install -dm 755 "$pkgdir"/usr/{bin,share/{applications,pixmaps}}
  install -m755 *.AppImage "$pkgdir/usr/bin/$_pkgname"
  install -D -m 644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -D -m 644 "${srcdir}/glogo.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
}
