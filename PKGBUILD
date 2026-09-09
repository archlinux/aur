# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=turanmahmudov
_gitname=masume
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A database client for the terminal"

pkgver=0.0.3
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('Apache-2.0')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

options=('!strip')

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[0]}.tar.gz")
sha256sums_x86_64=('5412a0494c14dae672a589be89f1d701eb38a4ad2a856d51299003230836e373')
sha256sums_aarch64=('5412a0494c14dae672a589be89f1d701eb38a4ad2a856d51299003230836e373')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" -t "${pkgdir}/usr/bin/"

	install -Dm644 "config.example.toml" -t "${pkgdir}/usr/share/doc/${pkgname}/config/"

	install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"

	install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
