# Maintainer: DeepChirp <deepchirp@archlinuxcn.org>
pkgname=easyeffects-jtrv-presets-git
pkgver=r11.e4a1ff4
pkgrel=1
pkgdesc="Community Presets for Easyeffects: NPR-like tuning for masculine voices + noise reduction"
arch=('any')
url="https://gist.github.com/jtrv/47542c8be6345951802eebcf9dc7da31"
license=('unknown')
depends=('easyeffects>=7.0.0' 'lsp-plugins-lv2>=1.2.17' 'rnnoise' 'libdeep_filter_ladspa')
makedepends=('git')
source=("${pkgname}::git+https://gist.github.com/47542c8be6345951802eebcf9dc7da31.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "$pkgname"

  install -Dm644 -t "${pkgdir}/usr/share/easyeffects/input/jtrv-Presets/" *.json
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}/" README.md
}
