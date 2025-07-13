# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=thomasschafer
_pkgname=scooter
pkgname=${_pkgname}-bin
pkgver=0.5.4
pkgrel=1
pkgdesc="An interactive find and replace in the terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-${arch[0]}-unknown-linux-musl.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-${arch[1]}-unknown-linux-musl.tar.gz")
sha256sums=('af818a9cb6e45a1317662644ec51a15b2f2cba198796b7b39db317766d206863'
            '671f384240b3e8ee0242a08b95c1651466f8d572592bd4269657a1e3819700ad')
sha256sums_x86_64=('4a70f8c43f1dde4dac740a3ee3b93d163139e96e602f6c7889fdc7fbad3da32d')
sha256sums_aarch64=('7bd70f10423130ba75c5d65d698bd30cd23d0cf35df69d05dba63b5ff9553c59')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
