# Maintainer: Mathieu Lemay <acidrain1@gmail.com>
pkgname=okta-cli-bin
_pkgname=okta-cli
pkgver=0.8.0
pkgrel=1
pkgdesc='The Okta CLI is the easiest way to get started with Okta!'
url='https://github.com/okta/okta-cli'
source=("https://github.com/okta/okta-cli/releases/download/${_pkgname}-tools-${pkgver}/${_pkgname}-linux-${pkgver}-x86_64.zip")
arch=('x86_64')
license=('Apache')
depends=('zlib')
conflicts=('okta-cli')
provides=('okta-cli')
sha256sums=('c076c472854677129c93028ab601b4968927519dd068d705b4d8c45cf21fc80e')

package() {
  cd "$srcdir/"

  install -Dm755 okta "${pkgdir}/usr/bin/okta"

  "${pkgdir}/usr/bin/okta" generate-completion > compl

  install -Dm644 compl "${pkgdir}/usr/share/bash-completion/completions/okta.bash"
  install -Dm644 compl "${pkgdir}/usr/share/zsh/site-functions/_okta"

  rm compl
}

