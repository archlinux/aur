# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=merlinfuchs
_gitname=blimp
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Customizable terminal UI for monitoring weather information, application status, network latency, and more"

pkgver=0.4.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'i686' 'aarch64')
_barch=('linux_amd64' 'linux_386' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

options=('!strip')

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[0]}.tar.gz")
source_i686=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[1]}.tar.gz")
source_aarch64=("${_appname}-${arch[2]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[2]}.tar.gz")
b2sums_x86_64=('0a2d6f8645247160084837f6355f1528f58ca063b5fe8661ba27b3314ad8f9084ebecdf370c8adfa392a829a4167407634844ee7ab0829d6bb129b6bfc544052')
b2sums_i686=('ca7c4c0793c2df1feab4c94cd7d96d7eaaef66a1d03996077547908dee1ba3eb3431f314c60c140789d59c9c4241b859e5e8ec70fec42457b49ad43b7f341c90')
b2sums_aarch64=('69d98ee8d3104db08adb9222d59985b836328d1732fa1f6a432310e4ccb79d60465c8c7f6b9169470ff7c6e872e2f19b848b64975c8d4b3721989e3ce6a86c82')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" -t "${pkgdir}/usr/bin/"

	install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"
	install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
