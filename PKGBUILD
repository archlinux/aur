# Maintainer: bash000000 <hidden>

# Certificate installed at /usr/share/adguard-cli/

pkgname=adguard-cli-bin
pkgver=1.2.32
_pkgstatus=release
pkgrel=3
pkgdesc='Surf the Web ad-free and safely. Shields up'
arch=('x86_64')
url='https://adguard.com/'
depend=('nss')

_full_name="adguard-cli-${pkgver}-linux-${arch}"

source=(
  "https://github.com/AdguardTeam/AdGuardCLI/releases/download/v${pkgver}-${_pkgstatus}/${_full_name}.tar.gz"
)
sha256sums=('1eda847d1325612a5379343be23f47d9786673f81b1ae0cd439fc1464eefbb26')

package() {
  cd "${srcdir}/${_full_name}"
  install -D "adguard-cli" "${pkgdir}/usr/share/adguard-cli/adguard-cli"
  install -D "adguard_root_helper" "${pkgdir}/usr/share/adguard-cli/adguard_root_helper"
  install -D "bash-completion.sh" "${pkgdir}/usr/share/bash-completion/completions/adguard-cli.sh"
  install -D "install_cert.sh" "${pkgdir}/usr/share/adguard-cli/install-cert.sh"
  install -D "defaults.zip" "${pkgdir}/usr/share/adguard-cli/defaults.zip"
  mkdir -p "${pkgdir}/usr/bin"
  ln -s /usr/share/adguard-cli/adguard_root_helper "${pkgdir}/usr/bin/adguard_root_helper"
  ln -s /usr/share/adguard-cli/adguard-cli "${pkgdir}/usr/bin/adguard-cli"
}
