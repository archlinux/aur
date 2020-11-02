# Maintainer: Pierre-Yves Ritschard <pyr@spootnik.org>

pkgname=exoscale-cli
pkgver=1.20.0
pkgrel=1
pkgdesc="Command-line tool for everything at Exoscale: compute, storage, dns"
arch=('x86_64')
url="https://github.com/exoscale/cli"
license=('EPL')
provides=('exoscale-cli')
conflicts=('exoscale-cli')

source=("https://github.com/exoscale/cli/releases/download/v${pkgver}/${pkgname}_${pkgver}_linux_amd64.tar.gz")

sha256sums=('d5179128b4a132bec432d615ca56c53877ba59b56680030aa46b62839e7ede53')

package() {
  install -Dm755 "${srcdir}/exo" "${pkgdir}/usr/bin/exo"
  install -d 755 "${pkgdir}/usr/share/bash-completion/completions"
  install -Dm 644 "${srcdir}/contrib/completion/bash/exo" "${pkgdir}/usr/share/bash-completion/completions/exo"
  install -d 755 "${pkgdir}/usr/share/man/man1"
  install -Dm 644 "${srcdir}/manpage/"* "${pkgdir}/usr/share/man/man1"
}
