# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=l5yth
_pkgname=psn
pkgname=${_pkgname}-bin
pkgdesc="A Rust terminal UI for viewing process status and sending signals"

pkgver=0.1.6
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('Apache-2.0')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'libgcc')

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}")
sha256sums=('a446b0021c71319341afb5fac9333c51e20a4e8545ca88842cc4275af1ea5db0'
            '151eccbd6510c963ab990ab2989c8d3cebde6fb05a6e5a9b0090ba414092f7d8')
sha256sums_x86_64=('d00ad4f619443816bcf06bed638827d0373b4afadd55549dc5fc194d249aec81')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
