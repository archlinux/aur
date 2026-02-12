# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=lance0
_pkgname=ahab
pkgname=${_pkgname}-bin
pkgdesc="A Docker cleanup TUI - hunt down and harpoon unused Docker resources"

pkgver=0.3.5
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x86_64' 'linux-aarch64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("README-${pkgver}.md::${_urlraw}/README.md"
        "LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}.tar.gz")
sha256sums=('5cb4bd2742699125ef61af03304141eabf8a0f7b13fecbdab0baac9cb3b67cc7'
            'd562492c8932ae3dda2c01d30d8b1c8db91f71217b719e25d4e45de73dce1b26')
sha256sums_x86_64=('a79c6c40deb397c9af10c904b9f631d62f9bbd1024efeffe15509ee6d87dc70b')
sha256sums_aarch64=('a79c6c40deb397c9af10c904b9f631d62f9bbd1024efeffe15509ee6d87dc70b')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
