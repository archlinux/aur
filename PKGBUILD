# Maintainer: dougEfresh <dchimento@gmail.com>
pkgname=pi-ext-spellcheck
pkgver=0.1.1
pkgrel=1
pkgdesc='Codebook-powered spell checking for pi-coding-agent'
arch=('any')
url='https://github.com/dougefresher/pi-ext-spellcheck'
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dougefresher/pi-ext-spellcheck/archive/refs/tags/v${pkgver}.tar.gz")
install='pi-ext.install'
sha256sums=('0c20af080367564fea72e7cc9e73876dce84ef68e03f5e2dd0e5e9807762f52e')
optdepends=('pi-coding-agent' 'pi-coding-agent-git')

package() {
  install -d "${pkgdir}/usr/share/pi/extensions/spellcheck"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  cp -a "${srcdir}/pi-ext-spellcheck-${pkgver}/." "${pkgdir}/usr/share/pi/extensions/spellcheck/"
  install -m644 "${srcdir}/pi-ext-spellcheck-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Remove dev/build-only files
  rm -f "${pkgdir}/usr/share/pi/extensions/spellcheck/bun.lock"
  rm -f "${pkgdir}/usr/share/pi/extensions/spellcheck/.gitignore"
  rm -f "${pkgdir}/usr/share/pi/extensions/spellcheck/biome.json"
  rm -rf "${pkgdir}/usr/share/pi/extensions/spellcheck/.changeset"
}
