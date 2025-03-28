# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=sectordistrict
_pkgname=intentrace
pkgname=${_pkgname}-bin
pkgver=0.7.4
pkgrel=1
pkgdesc="strace with intent, it goes all the way for you instead of half the way"
arch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}-${arch[0]}")
sha256sums=('002c2696d92b5c8cf956c11072baa58eaf9f6ade995c031ea635c6a1ee342ad1'
            'd3e130f4946ff1c7fa052c0b29fcadbca87de52908ea04b101288b9fbb06d2ef')
sha256sums_x86_64=('a56e622c12957cb9e77610ade0639cdc10d5a0a17cc2fedf76a9f7b722890a5e')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"

	install -Dm644 "README-${pkgver}" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
