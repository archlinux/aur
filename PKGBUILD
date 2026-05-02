# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=iRootPro
_gitname=rdr
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Terminal RSS/Atom feed reader built with Go"

pkgver=0.9.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.en.md")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_barch[1]}.tar.gz")
sha256sums=('cd00bd35c1334a0708d8c7cb3b0473c53a7aa6bf403eee38a60c395fbc6220bb')
sha256sums_x86_64=('778ee134387d612dece64a70b92177b79c8b0bf30049feb076405bcc095d195c')
sha256sums_aarch64=('41714fd3d95119d6af12689a96657a52dbe23af30314db5c68b8ab84bcf1ce82')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
