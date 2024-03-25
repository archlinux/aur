# Maintainer: Kazuya Yokogawa <mapk0y at gmail.com>

pkgname='dirmap'
pkgver="0.3.3"
pkgrel=1
pkgdesc='dirmap is a tool for generating a directory map'
url='https://github.com/k1LoW/dirmap'
license=('MIT')
arch=('x86_64')
#depends=('')
#conflicts=('')
source=("${url}/releases/download/v${pkgver}/${pkgname}_v${pkgver}_linux_amd64.tar.gz")
sha256sums=('1ca706d98e1e5d68d5b5d690fbd4344451360e0fba4c48a5eaf03ae49a38c8dd')

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
