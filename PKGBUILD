# Maintainer: Pierre-Yves Ritschard <pyr@spootnik.org>

pkgname=exoscale-cli
pkgver=1.9.0
pkgrel=1
pkgdesc="Command-line tool for everything at Exoscale: compute, storage, dns"
arch=('x86_64')
url="http://exoscale.github.io/cli/"
license=('EPL')
provides=('exoscale-cli')
conflicts=('exoscale-cli')

source=("https://github.com/exoscale/cli/releases/download/v${pkgver}/${pkgname}_${pkgver}_linux_amd64.tar.gz")

md5sums=('502fa9f04a292c47c0bc9fb5c6cd3541')

package() {
  install -Dm755 "${srcdir}/exo" "${pkgdir}/usr/bin/exo"
  install -d 755 "${pkgdir}/usr/share/bash-completion/completions"
  install -Dm 644 "${srcdir}/contrib/completion/bash/exo" "${pkgdir}/usr/share/bash-completion/completions/exo"
  install -d 755 "${pkgdir}/usr/share/man/man1"
  install -Dm 644 "${srcdir}/manpage/"* "${pkgdir}/usr/share/man/man1"
}
