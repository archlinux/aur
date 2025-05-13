# Maintainer: bash000000 <hidden>

# Certificate installed at /usr/share/adguard-cli/

pkgname=adguard-cli-bin
pkgver=1.0.16
_pkgstatus=release
pkgrel=2
pkgdesc='Surf the Web ad-free and safely. Shields up'
arch=('x86_64')
url='https://adguard.com/'

_file="adguard-cli"
_file1="adguard_root_helper"
_file2="certutil"
_full_name="${_file}-${pkgver}-linux-${arch}"

source=(
	"https://github.com/AdguardTeam/AdGuardCLI/releases/download/v${pkgver}-${_pkgstatus}/${_full_name}.tar.gz"
)
sha256sums=('4486ac312793f4b8781b30bb312b48c1bd4c19eace244d2f59fa9fe3511f5c91')

package() {
    cd "${srcdir}/${_full_name}"
    install -D "${_file}" "${pkgdir}/usr/share/${_file}/${_file}"
    install -D "${_file1}" "${pkgdir}/usr/share/${_file}/${_file1}"
    install -D "${_file2}" "${pkgdir}/usr/share/${_file}/${_file2}"
    install -D "bash-completion.sh" "${pkgdir}/usr/share/bash-completion/completions/${_file}.sh"
    install -D "install_cert.sh" "${pkgdir}/usr/share/${_file}/install-cert.sh"
    install -D "defaults.zip" "${pkgdir}/usr/share/${_file}/defaults.zip"
    mkdir -p "${pkgdir}/usr/bin"
    ln -s /usr/share/${_file}/${_file} "${pkgdir}/usr/bin/${_file}"
    ln -s /usr/share/${_file}/${_file1} "${pkgdir}/usr/bin/${_file1}"
    ln -s /usr/share/${_file}/${_file2} "${pkgdir}/usr/bin/adguard-${_file2}"
}
