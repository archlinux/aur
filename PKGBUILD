# Maintainer: robertfoster
pkgname=easyeffects-m0rf30-presets
_origin=easyeffects-presets
pkgver=1.0.0 # renovate: datasource=github-releases depName=M0Rf30/easyeffects-presets
pkgrel=1
pkgdesc="Community Presets for Easyeffects: curated EQ, bass, loudness, immersive dynamics and headphone-virtualization (HeSuVi, EFOtech MLV, SOFA HRTF) presets"
arch=('any')
url="https://github.com/M0Rf30/${_origin}"
license=('MIT')
depends=('easyeffects>=7.2.0' 'calf' 'lsp-plugins-lv2')
source=("${_origin}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('bf057230c1f5c8c6a7e514ae8ebf4d6862055daa7a57cf746da8413ba43cf37c')

package() {
  cd "${_origin}-${pkgver}"

  local presetsdir="${pkgdir}/usr/share/easyeffects/output/M0Rf30-Presets"
  local irsdir="${pkgdir}/usr/share/easyeffects/irs/M0Rf30-Presets"

  install -Dm644 -t "${presetsdir}" *.json
  install -Dm644 -t "${irsdir}" irs/*.irs
  install -Dm644 -t "${irsdir}" irs/*.sofa

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
