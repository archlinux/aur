# Maintainer: bash000000 <hidden>

# Certificate installed at /usr/share/adguard-cli/

pkgname=adguard-cli-bin
pkgver=0.99.12
pkgrel=1
pkgdesc='Fast, flexible and reliable VPN solution for command-line enthusiasts.'
arch=('x86_64')
url='https://adguard.com/'

_file="adguard-cli"
_full_name="${_file}-${pkgver}-linux-${arch}"

source=(
	"https://github.com/AdguardTeam/AdGuardCLI/releases/download/v${pkgver}-nightly/${_full_name}.tar.gz"
)
sha256sums=('dd9f6c6918509e5ce8003c40d2a6581677d1da899ad158a0d0bc77ada6eff479')

package() {
    install -D "${_file}" "${pkgdir}/usr/share/${_file}/${_file}"
    install -D "bash-completion.sh" "${pkgdir}/usr/share/bash-completion/completions/${_file}.sh"
    install -D "install_cert.sh" "${pkgdir}/usr/share/${_file}/install-cert.sh"
    install -D "defaults.zip" "${pkgdir}/usr/share/${_file}/defaults.zip"
    mkdir -p "${pkgdir}/usr/bin"
    ln -s ${pkgdir}/usr/share/${_file}/${_file} "${pkgdir}/usr/bin/${_file}"
}
