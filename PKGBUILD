# Maintainer: longyinstudio<1606776851@qq.com>
pkgname=devcrate
pkgver=0.1.0
pkgrel=1
pkgdesc="A fast, cross-platform developer toolkit built on Tauri."
arch=('x86_64')
url="https://github.com/LongYinStudio/DevCrate"
_ghurl="https://github.com/LongYinStudio/DevCrate"
license=('mit')
depends=('desktop-file-utils' 'gtk3' 'hicolor-icon-theme' 'webkit2gtk-4.1')
source=(
  "https://github.com/LongYinStudio/DevCrate/releases/download/v$pkgver/devcrate_"$pkgver"_amd64.deb"
  "devcrate.png"
  "devcrate.desktop"
)
sha256sums=(
  '49c006070cb442c7ce844cd01de63da25267379a10c945282031d2391575bbe6'
  'c195dadca4560de368eb437776443e8935011a02772ec19828c3cbef9ecf51f6'
  '2d182e37d3dd440d5e05a10e7c061cecd8adad28aa2e6def241053d6422c2e17'
)

package() {
  echo "Extracting the data.tar.gz..."
  bsdtar -xf data.tar.gz -C "$pkgdir/"

  install -Dm644 "${srcdir}/devcrate.png" \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/devcrate.png"

  install -Dm644 "${srcdir}/devcrate.desktop" \
    "${pkgdir}/usr/share/applications/devcrate.desktop"
}
