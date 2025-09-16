# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=sectordistrict
_pkgname=intentrace
pkgname=${_pkgname}-bin
pkgver=0.10.4
pkgrel=1
pkgdesc="strace with intent, it goes all the way for you instead of half the way"
arch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'gcc-libs')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}-${arch[0]}")
sha256sums=('002c2696d92b5c8cf956c11072baa58eaf9f6ade995c031ea635c6a1ee342ad1'
            '683a043641cc56aaf5dd6b62a4308f114985665d3fc236ad11b07967b49a0e09')
sha256sums_x86_64=('e087d0d2707aef1f431e1816173102be2f673f43b6303ab4635f072e32326b27')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"

	install -Dm644 "README-${pkgver}" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
