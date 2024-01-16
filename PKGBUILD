# Maintainer: Kazuya Yokogawa <mapk0y at gmail.com>

pkgname='dirmap'
pkgver="0.3.2"
pkgrel=1
pkgdesc='dirmap is a tool for generating a directory map'
url='https://github.com/k1LoW/dirmap'
license=('MIT')
arch=('x86_64')
#depends=('')
#conflicts=('')
source=("${url}/releases/download/v${pkgver}/${pkgname}_v${pkgver}_linux_amd64.tar.gz")
sha256sums=('4c53b3b62c5000e4036835af54c14eb25d6555532f600a5db56ae76ad76a121d')

package() {
  msg2 'Installing documentations...'
  install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "${srcdir}/CREDITS" "${pkgdir}/usr/share/doc/${pkgname}/CREDITS"
  install -Dm644 "${srcdir}/CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"

  msg2 'Installing executable...'
  install -Dm755 "${srcdir}/dirmap" "${pkgdir}/usr/bin/dirmap"

  msg2 'Installing bash completion'
  ${pkgdir}/usr/bin/dirmap completion bash >"${srcdir}/completion.bash"
  install -Dm644 "${srcdir}/completion.bash" "${pkgdir}/usr/share/bash-completion/completions/dirmap"

  msg2 'Installing zsh completion'
  ${pkgdir}/usr/bin/dirmap completion zsh >"${srcdir}/completion.zsh"
  install -Dm644 "${srcdir}/completion.zsh" "${pkgdir}/usr/share/zsh/site-functions/_dirmap"
}
