# Maintainer: Conner Will (DampSock) <conner.will@connerwill.com>
# Contributor: Conner Will (DampSock) <conner.will@connerwill.com>
# Contributor: Sergey Shepelev (temoto) <temotor@gmail.com>
# Contributor: Giuseppe Pagano (giuseongit) <giuseongit@latana.rocks>
# Contributor: Daniel Voogsgerd (DanielVoogsgerd)
#shellcheck disable=2148,2034,2154,2164

pkgname=yayfzf
pkgver=2.0.6
pkgrel=1
pkgdesc='fzf-based interface for searching, installing, removing, and managing packages using yay'
arch=('any')
url="https://github.com/ConnerWill/${pkgname}"
license=('GPL-3.0-or-later')
depends=('bash' 'fzf' 'yay')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  true
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ## Main executable
  install -vDm755 "bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  ## Documentation
  install -vDm644 "docs/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  ## Man page
  install -vDm644 "docs/${pkgname}.1" "${pkgdir}/usr/share/man/man1/${pkgname}.1"

  ## License
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  ## Zsh completion
  install -vDm644 "completion/_${pkgname}" "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"

  ## Bash completion
  install -vDm644 "completion/${pkgname}_completion.sh" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
}
