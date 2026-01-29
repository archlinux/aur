# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=albertoboccolini
_pkgname=dsw
pkgname=${_pkgname}-bin
pkgdesc="A simple, lightweight local alternative to TriggerCMD"

pkgver=0.0.1
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_linux_${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_linux_${_barch[1]}.tar.gz")
sha256sums=('859eb190b73b79fb7ff00b19bec989abe222efe8127df15c5bf857fdbbd61abe'
            '5a742f7405e78a80fe5f06ed57138d8154856aecaeecc71f8f1d5345352d8101')
sha256sums_x86_64=('15bbd09e85a954cbeddd112810890c3cd7fcabb1bca1e30641c71330dd1e40f2')
sha256sums_aarch64=('df6419260c0fff840f3dcd314bbb3aff378fcbbfc7f32e3fbb6b90444b8e4967')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
