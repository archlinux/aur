# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=huseyinbabal
_pkgname=taws
pkgname=${_pkgname}-bin
pkgdesc="A terminal-based AWS resource viewer and manager"

pkgver=1.3.0
pkgrel=8
_pkgvername=v${pkgver}-rc.${pkgrel}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-musl' 'aarch64-unknown-linux-musl')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[1]}.tar.gz")
sha256sums=('57dcba79753b55c060bb71a06abe9563afb742d31be067c0c0e735b5a58223f9'
            'ce82a825a3422ddfa19738a804d579068b2ec7654479e400f0c26784e3676c86')
sha256sums_x86_64=('021c935ad19a038cc5c59f436cb2b480ff9f981266c830ad20cc80d58250f8b5')
sha256sums_aarch64=('e104794af55fbd51f654478a743e546c51cd3dbe2accbdd50198ac8ae22f21ea')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
