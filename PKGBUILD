# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=uroybd
_pkgname=DotR
pkgname=${_pkgname,,}-bin
pkgdesc="A dotfiles manager that is as dear as a daughter"

pkgver=2.2.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-gnu' 'aarch64-unknown-linux-gnu')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'gcc-libs')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname,,}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname,,}-${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname,,}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname,,}-${_barch[1]}.tar.gz")
sha256sums=('8cd2c6449c4828698f46c481acab9f8e90e182c7a019946bf4e817e140b19799'
            '4ffe37617b561792702849f7ee3f211e5df34eec84f8787df43939d7d7373f9a')
sha256sums_x86_64=('926ca50d2f522637b2c2e3a50602216a899782a3493752e1ea56e307af54dcb9')
sha256sums_aarch64=('3c68ab1296942fe938cd4e654ad760d6a3049ef527b56fca377fd5fccb2914bd')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname,,}" "${pkgdir}/usr/bin/${_pkgname,,}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
