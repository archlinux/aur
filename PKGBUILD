# Maintainer: robertfoster

pkgname=projectm-presets-m0rf30-git
pkgver=1.08c56dc
pkgrel=1
pkgdesc="Preset pack for projectM - M0Rf30's curated MilkDrop 2 presets with warp/comp shaders (git version)"
arch=('any')
url="https://github.com/M0Rf30/projectm-presets"
license=('MIT')
depends=('libprojectm>=4.1')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+${url}.git")

pkgver() {
  cd "${pkgname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd "${pkgname}"
  make DESTDIR="${pkgdir}" install

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

sha256sums=('SKIP')
