# Maintainer: Mogeko <zhengjunyi@live.com>

pkgname=mpv-autosub-zh
_pkgname=${pkgname%-zh}
pkgver=0.0.1
pkgrel=2
pkgdesc="Fully automatic subtitle (Chinese) downloading for the MPV media player"
arch=("any")
url="https://github.com/davidde/mpv-autosub"
license=("MIT")
depends=("mpv")
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
  "${_pkgname#mpv-}.lua"
  "LICENSE"
)
sha256sums=(
  "45b4a1b1a88899b92f5e396982443034105f10e393f1279841d4a1d511b2b53b"
  "69d6b2bf0bf3d6f008b528cfe715c340080e97589605196f67ed43ca90540980"
)

package() {
  install -Dm644 "${source[0]}" \
    -t "$pkgdir"/usr/share/mpv/scripts
  
  install -Dm644 "${source[1]}" \
    -t "$pkgdir"/usr/share/licenses/"$pkgname"
}
