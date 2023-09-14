# Maintainer: Pierre-Yves Ritschard <pyr@spootnik.org>
# Contributor: FabioLolix

pkgname=exoscale-cli-bin
pkgver=1.73.0
pkgrel=1
pkgdesc="Command-line tool for everything at Exoscale: compute, storage, dns"
arch=('x86_64')
url="https://github.com/exoscale/cli"
license=('Apache')

provides=('exoscale-cli')
conflicts=('exoscale-cli')

source=("https://github.com/exoscale/cli/releases/download/v${pkgver}/exoscale-cli_${pkgver}_linux_amd64.tar.gz")
sha256sums=('14fd5d9fbffd77662d74936ee9877193b0d930e7bac2a94d03d790258f8ba785')

package() {
  install -Dm755 "${srcdir}/exo" "${pkgdir}/usr/bin/exo"
  install -d 755 "${pkgdir}/usr/share/bash-completion/completions"
  install -Dm 644 "${srcdir}/contrib/completion/bash/exo" "${pkgdir}/usr/share/bash-completion/completions/exo"
  install -d 755 "${pkgdir}/usr/share/man/man1"
  install -Dm 644 "${srcdir}/manpage/"* -t "${pkgdir}/usr/share/man/man1"
}
