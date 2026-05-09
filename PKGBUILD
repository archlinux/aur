# Maintainer: DeepChirp <deepchirp@archlinuxcn.org>
pkgname=easyeffects-digitalone1-presets-git
_origin=EasyEffects-Presets
pkgver=r77.6fc0630
pkgrel=1
pkgdesc="Community Presets for Easyeffects: Loudness Equalizer"
arch=('any')
url="https://github.com/Digitalone1/${_origin}"
license=('MIT')
depends=('easyeffects>=8.0.0' 'lsp-plugins-lv2>=1.2.17')
makedepends=('git')
source=("${_origin}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_origin}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "${_origin}"

  install -Dm644 -t "${pkgdir}/usr/share/easyeffects/output/Digitalone1-Presets/" \
    "LoudnessEqualizer.json" \
    "LoudnessCrystalEqualizer.json"

  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" "LICENSE"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}/" "README.md"
}
