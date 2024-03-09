PACKAGER="Laurent Brock <incognito0135@protonmail.com>"

pkgname=plasma-active-accent-frame-decorations
pkgver=9.2
pkgrel=1
pkgdesc="Window styles for KDE Plasma highlighting the active window in the color scheme's accent color"
url='https://github.com/nclarius/Plasma-window-decorations'
license=('GPL3')
arch=('any')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e85f95832c988154a065daba6289fe5197f32aee5eaeec1726cb251fdea2f61f')
sha512sums=('eb426f896171d53ffa70470139b6ae132ab6932d8646887e62315dcbe6ba22ed66d2feec11d78bb84ba75cd0178ab542285960349615f8bc4faca27f24ac8b0a')

# prepare() {
#   cd "${srcdir}"
#   tar -xf "Plasma-window-decorations-${pkgver}.tar.gz"
# }

package() {
  cd ${srcdir}/Plasma-window-decorations-${pkgver}/ActiveAccentFrame
  install -Dm755 --directory ActiveAccentFrame "$pkgdir/usr/share/aurorae/themes/ActiveAccentFrame"
  install -Dm644 ActiveAccentFramerc "$pkgdir"/usr/share/aurorae/themes/ActiveAccentFrame/ActiveAccentFramerc
  install -Dm644 decoration.svg "$pkgdir"/usr/share/aurorae/themes/ActiveAccentFrame/decoration.svg
  install -Dm644 metadata.desktop "$pkgdir"/usr/share/aurorae/themes/ActiveAccentFrame/metadata.desktop
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}

