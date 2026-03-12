# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appname=t2l
_pkgauthor=scipenai
_pkgname=tylax
pkgname=${_pkgname}-bin
pkgdesc="A bi-directional converter between Typst and LaTeX"

pkgver=0.3.4
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64')
_barch=('x86_64-unknown-linux-gnu')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('Apache-2.0')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'libgcc')

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_appname}-${_pkgvername}-${_barch[0]}.tar.gz")
sha256sums=('68505cdbf55251e44cceacbd42bfcf852c4a4a3851629e76b45e18773cdedd6e'
            '146af9a2ad4ef664ca3122983c21f9ae80090e51e1a65afac8e4a8e635084a8f')
sha256sums_x86_64=('d5a51f4f654681e09121ff1f14ed3384bc028d81d75cc5978c2c0ff2bf8951ce')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
