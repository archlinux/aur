# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=serkanyersen
_pkgname=dotstate
pkgname=${_pkgname}-bin
pkgdesc="A modern, secure, and user-friendly dotfile manager"

pkgver=0.2.18
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
            '82c3165de80d935790bf733de80de4cfd6b83ef58c5f75a27bd0fb7e2d785de1')
sha256sums_x86_64=('3cee0cef9356af1280079dfa82cd73f11b1741e7bd13d475ae7d51958540330a')
sha256sums_aarch64=('abe1c48133b9527dba5098665a876700f7bd97f6ac56c4bb0ece5b85cc53a688')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
