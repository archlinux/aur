# Maintainer: Pierre-Yves Ritschard <pyr@spootnik.org>

pkgname=exoscale-cli
pkgver=1.10.0
pkgrel=1
pkgdesc="Command-line tool for everything at Exoscale: compute, storage, dns"
arch=('x86_64')
url="http://exoscale.github.io/cli/"
license=('EPL')
provides=('exoscale-cli')
conflicts=('exoscale-cli')

source=("https://github.com/exoscale/cli/releases/download/v${pkgver}/${pkgname}_${pkgver}_linux_amd64.tar.gz")

sha256sums=('d8de8ae4c46870fbefc0cb93ca0d2ae8a03447b1d42cb5da7d304cb74e8b8bc9')

package() {
  install -Dm755 "${srcdir}/exo" "${pkgdir}/usr/bin/exo"
  install -d 755 "${pkgdir}/usr/share/bash-completion/completions"
  install -Dm 644 "${srcdir}/contrib/completion/bash/exo" "${pkgdir}/usr/share/bash-completion/completions/exo"
  install -d 755 "${pkgdir}/usr/share/man/man1"
  install -Dm 644 "${srcdir}/manpage/"* "${pkgdir}/usr/share/man/man1"
}
