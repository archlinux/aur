# Maintainer: NoverPlay Team
pkgname=noverplay-bin
pkgver=1.0.8
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
sha256sums_x86_64=('a903fbe3753b3d9c8a9e6ad9f51f9ce56dc9e753b1a1a2e179997a480841f3ab')

package() {
  cd "${srcdir}/noverplay-${pkgver}-x86_64"
  install -Dm755 noverplay "${pkgdir}/usr/bin/noverplay"
  install -Dm644 noverplay.desktop "${pkgdir}/usr/share/applications/noverplay.desktop"
  install -Dm644 noverplay.png "${pkgdir}/usr/share/pixmaps/noverplay.png"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
