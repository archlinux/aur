# Maintainer: Pierre-Yves Ritschard <pyr@spootnik.org>
# Contributor: FabioLolix

pkgname=exoscale-cli-bin
pkgver=1.74.0
pkgrel=1
pkgdesc="Command-line tool for everything at Exoscale: compute, storage, dns"
arch=('x86_64')
url="https://github.com/exoscale/cli"
license=('Apache')

validpgpkeys=('7100E8BFD6199CE0374CB7F003686F8CDE378D41')
provides=('exoscale-cli')
conflicts=('exoscale-cli')

source=("https://github.com/exoscale/cli/releases/download/v${pkgver}/exoscale-cli_${pkgver}_linux_amd64.tar.gz"
        "https://github.com/exoscale/cli/releases/download/v${pkgver}/exoscale-cli_${pkgver}_linux_amd64.tar.gz.sig")
sha256sums=('1cde93375e92d37dd49f442701129e0ad6278bae6734e2204681b8ac98f55456'
            'SKIP')

package() {
  install -Dm755 "${srcdir}/exo" "${pkgdir}/usr/bin/exo"
  install -d 755 "${pkgdir}/usr/share/bash-completion/completions"
  install -Dm 644 "${srcdir}/contrib/completion/bash/exo" "${pkgdir}/usr/share/bash-completion/completions/exo"
  install -d 755 "${pkgdir}/usr/share/man/man1"
  install -Dm 644 "${srcdir}/manpage/"* -t "${pkgdir}/usr/share/man/man1"
}
