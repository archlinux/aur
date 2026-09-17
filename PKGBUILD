# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=sQVe
_pkgname=grove
pkgname=${_pkgname}-bin
pkgdesc="A fast, intuitive Git worktree management CLI that makes Git worktrees as simple as switching branches"

pkgver=1.12.0
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
sha256sums=('6a3a6ef2803d3895188ed59b143373690fa08208bffcfd7c905fc1c3397da9e4')
sha256sums_x86_64=('9236d159a766bb26b9120c70b3e8779420b995ed47ce1e1840914efefb23cf64')
sha256sums_aarch64=('e269bd711aefaa83b9742d6ccf4b595f66ad2139cc20445af2f4aecc1f86d7ae')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
