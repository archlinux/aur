# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="snake-asm"
pkgname="${_pkgname}-bin"
pkgver=0.4.1
pkgrel=1
pkgdesc="Terminal-based snake game written in x86_64 assembly"
arch=('x86_64')
url="https://github.com/NikitaIvanovV/${_pkgname}"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("README-${pkgver}.md::${url}/raw/v${pkgver}/README.md"
        "LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}.tar.gz")
sha256sums=('7d0da8213e80084af892398a2a60a1e79e7b82e01798db8b1d50dcac87cf61ab'
            '271109ebf93c67fe7617ccc8573031d25dd26e2df0f1b2902bc5f9b13442d550')
sha256sums_x86_64=('ef5ace03e40c69247e15188a876acbfdf58389b86e522fe2734d69cb9bb01c9e')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}"         "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE-${pkgver}"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}