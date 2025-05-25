# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=drunkleen
_pkgname=leenfetch
pkgname=${_pkgname}-bin
pkgver=0.2.2
pkgrel=1
pkgdesc="Fast, minimal, customizable system info tool in Rust (Neofetch alternative)"
arch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('libx11' 'libxrandr' 'glibc' 'gcc-libs')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-${arch[0]}.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-${arch[1]}.tar.gz")
sha256sums=('e673ac9666ad19db4dceaac6e42e8b0c3e9e86b1911e6877bb6ee7f3f31565ee'
            'b86578f8457b84c49547c7d1fb6b06ef76158d97c480abb1c9604e592272a5ca')
sha256sums_x86_64=('79af3143e6314d428d58a407e6aea4bc677f42a2c78385e14173bed285c8b4e3')
sha256sums_aarch64=('50cfdbbf43da3378304572f67b23749a94b60ddacccc28e92557403b99befbc3')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
