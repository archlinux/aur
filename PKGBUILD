# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=gitsocial-org
_gitname=gitsocial
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Git-native cross-forge collaboration: posts, issues, PRs, releases, all in your repo"

pkgver=0.29.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url='https://gitsocial.org/'

license=('MIT')

depends=('glibc' 'git')
provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}_${pkgver}_${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}_${pkgver}_${_barch[1]}.tar.gz")
sha256sums_x86_64=('3a3c211093ff1d10903a26a33bdf5d3c51728b2204c96b224a244430a15edfc7')
sha256sums_aarch64=('d013f3dbd768476e8bda702670756a876349c2e759143bb021cd733d4e58db0a')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
