# Maintainer: NoverPlay Team
pkgname=noverplay-bin
pkgver=1.1.1
pkgrel=1
pkgdesc='NoverPlay desktop music player'
arch=('x86_64')
url='https://noverplay.space'
license=('custom:proprietary')
depends=('gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator' 'openssl' 'hicolor-icon-theme')
optdepends=('yt-dlp: optional media extraction helper')
provides=('noverplay')
conflicts=('noverplay')
options=('!strip')
source_x86_64=("https://noverplay.space/download/linux/noverplay-${pkgver}-x86_64.tar.gz")
sha256sums_x86_64=('4d9ea95e88bcdb28343078229399508d6d3c2e9673dc57156ba4627fe796f343')

package() {
  cd "${srcdir}/noverplay-${pkgver}-x86_64"
  install -Dm755 noverplay "${pkgdir}/usr/bin/noverplay"
  install -Dm644 noverplay.desktop "${pkgdir}/usr/share/applications/noverplay.desktop"
  install -Dm644 noverplay.png "${pkgdir}/usr/share/pixmaps/noverplay.png"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
