# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=Helius-Finance
_gitname=helius-finance-tracker
_appname=${_gitname%-finance-tracker}
pkgname=${_appname}-bin
pkgdesc="Local-first personal finance tracker for with a Rust CLI/TUI, SQLite ledger, budgets, recurring bills, reconciliation, and cashflow forecasting"

pkgver=1.4.3
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('linux-x86_64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('AGPL-3.0')

provides=("${_appname}")
conflicts=("${_appname}" "${_gitname}")

depends=('glibc' 'libgcc')

options=(!strip)

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_gitversion}-${_barch[0]}.tar.gz")
sha256sums_x86_64=('363994dbfee7c231edbfc1ca67528853503cdeb3f38fa576870eaa8fdfe81191')


package() {
	cd "${srcdir}/${_appname}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
