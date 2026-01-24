# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=serkanyersen
_pkgname=dotstate
pkgname=${_pkgname}-bin
pkgdesc="A modern, secure, and user-friendly dotfile manager"

pkgver=0.2.17
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64' 'aarch64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}-unknown-linux-musl.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[1]}-unknown-linux-musl.tar.gz")
sha256sums=('7efa2e24bd29cabcff7c83ee7695a8a53701d94974a4284537be6f4f1b0020a0'
            'cc82558a9239dd1b131c47a5b2d40345de06709d38327565424ff11678371789')
sha256sums_x86_64=('6cd2cc9ead07a6a0f3f0b54fceb3095c64a6263bef1097a109610ad850c2d5cc')
sha256sums_aarch64=('6277fead168874dde9a7e5b34795546db4c6c321faa7c056e62cbb1fd63f4ba0')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
