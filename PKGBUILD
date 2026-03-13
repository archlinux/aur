# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=mcandre
_pkgname=buttery
pkgname=${_pkgname}-bin
pkgver=0.0.26
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="A video editor with manual motion smoothing"

arch=('x86_64' 'aarch64')
_barch=('linux-amd64' 'linux-arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('BSD-2-Clause')

provides=("${_pkgname}")
depends=('glibc' 'gcc-libs')
conflicts=("${_pkgname}"{,-git})

source=("README-${pkgver}.md::${_urlraw}/README.md"
        "LICENSE-${pkgver}::${_urlraw}/LICENSE.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}.tgz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[1]}.tgz")
sha256sums=('83d06a6ab4aec364298583bb3f263cf939b2f2f7dc67c996d6febb99ab8a7d47'
            '9f2df22a75788fa52a08051d56dc8b4f0faa590d4df9213731bb383dd25c165d')
sha256sums_x86_64=('4a5a0cceb6c727fe519231840275288c7fc3835f09c903f558c90f26ecf79897')
sha256sums_aarch64=('de8de52d95fc289f9cae7a761e53af11d4323ce576594bfad379fac7f29cc014')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
