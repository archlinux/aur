# Maintainer: Hans-Nikolai Viessmann <hv15 at hw.ac.uk>
pkgname=sshprint
pkgver=1.6.2
_pkgrel=beta
pkgrel=1
pkgdesc="A ZSH script to print local files on remote printers using SSH"
arch=('any')
url="https://github.com/hv15/sshprint"
license=('MIT')
install=sshprint.install
depends=('openssh' 'zsh' 'gawk')
source=("https://github.com/hv15/sshprint/archive/${pkgver}-${_pkgrel}.tar.gz")
md5sums=('7516b88549057ef577ae7904e3328e46')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}-${_pkgrel}"
  # place the doc
  install -d "${pkgdir}/usr/share/doc/sshprint"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/sshprint/README"
  install -Dm644 "config.examples/config.example" "${pkgdir}/usr/share/doc/sshprint/config.example"
  install -Dm644 "config.examples/server_config.example" "${pkgdir}/usr/share/doc/sshprint/server_config.example"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # place the script
  install -Dm755 "sshprint" "${pkgdir}/usr/bin/sshprint"
}
