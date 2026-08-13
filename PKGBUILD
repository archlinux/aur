# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=p-arndt
_gitname=shenv
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="End-to-end encrypted .env sharing. Store anywhere, decrypt only with authorized teammates. No server needed."

pkgver=0.7.1
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('Unlincense')

provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}_${pkgver}_${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}_${pkgver}_${_barch[1]}.tar.gz")
sha256sums=('19341b2e165f8cc6f216c070e6e3bd521cb8c623d7eb60b4063c56398daa34c0')
sha256sums_x86_64=('4a66afb1ccccd4a058766be935c8164bee53fa16410c1aea4346ebe525a29597')
sha256sums_aarch64=('dabf901daa5203d782532b6538133fc53375c8922a929904183cfea63ab9df20')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
