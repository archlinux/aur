# Maintainer: Pierre-Yves Ritschard <pyr@spootnik.org>
# Contributor: FabioLolix

pkgname=exoscale-cli-bin
pkgver=1.74.1
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
sha256sums=('4914abdca752cde77182e0f3aded7d3fb3a24431653ac02675a50b2c03f9f95f'
            'SKIP')

package() {
  install -Dm755 "${srcdir}/exo" "${pkgdir}/usr/bin/exo"
  install -d 755 "${pkgdir}/usr/share/bash-completion/completions"
  install -Dm 644 "${srcdir}/contrib/completion/bash/exo" "${pkgdir}/usr/share/bash-completion/completions/exo"
  install -d 755 "${pkgdir}/usr/share/man/man1"
  install -Dm 644 "${srcdir}/manpage/"* -t "${pkgdir}/usr/share/man/man1"
}
