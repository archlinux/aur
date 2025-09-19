# Maintainer: DeepChirp <DeepChirp@outlook.com>
pkgname=easyeffects-jtrv-presets-git
_origin=EasyEffects-Presets
pkgver=r6.c0a71a6
pkgrel=1
pkgdesc="Community Presets for Easyeffects: NPR-like tuning for masculine voices + noise reduction"
arch=('any')
url="https://gist.github.com/jtrv/47542c8be6345951802eebcf9dc7da31"
license=('custom')
depends=('easyeffects>=7.0.0' 'lsp-plugins-lv2>=1.2.17' 'rnnoise')
makedepends=('git')
source=("${_origin}::git+https://gist.github.com/47542c8be6345951802eebcf9dc7da31.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_origin}"

  printf "r%s.%s" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_origin}"

  outdir="${pkgdir}/usr/share/easyeffects/input/jtrv-Presets"
  install -dm755 "${outdir}"

  install -m644 "EasyEffects Microphone Preset: Masc NPR Voice + Noise Reduction.json" "${outdir}" \
    || { echo "Missing EasyEffects Microphone Preset: Masc NPR Voice + Noise Reduction.json"; return 1; }
}
