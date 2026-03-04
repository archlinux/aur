# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=sQVe
_pkgname=grove
pkgname=${_pkgname}-bin
pkgdesc="A fast, intuitive Git worktree management CLI that makes Git worktrees as simple as switching branches"

pkgver=1.8.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_linux_${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_linux_${_barch[1]}.tar.gz")
sha256sums=('491f4de3b0e824916ed217e14ae14d39cdf043ecd4fc413950f40dd703547867')
sha256sums_x86_64=('7bf30956c73fad1c2bb527eee02e92b08018ceb576f74e60246fd1fd58660151')
sha256sums_aarch64=('77c7d8f9f232de4671ad9fe9eff4fc060da44ad4413af551fe72d61a8914d217')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
