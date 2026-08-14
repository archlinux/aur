# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=JoaoOliveira889
_gitname=monogit
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Multi-repo Git dashboard for your terminal"

pkgver=0.3.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('Linux_x86_64' 'Linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

depends=('git')
provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_barch[1]}.tar.gz")
sha256sums_x86_64=('82cfd3a7b9e26b138f24ac0d5d33f8db640facad69c6f9fe0928e7743c8520ea')
sha256sums_aarch64=('9c2cc16cc9cb877cdc16c91158b315e80be7efdf3b1cf23cdc9ab9febb02ba39')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
