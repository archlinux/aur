# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=dim-an
_pkgname=cod
pkgname=${_pkgname}-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="A completion daemon for bash/zsh"
arch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('Apache-2.0')

depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}::${_urlraw}/README.org")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64.tgz")
sha256sums=('a6cba85bc92e0cff7a450b1d873c0eaa2e9fc96bf472df0247a26bec77bf3ff9'
            'd0e7f0ef006f4f6e1cf6e0fde5723bd0a032377ab9ea5be6ef2c6e84b94cb066')
sha256sums_x86_64=('d1a422828322cd59d747df4e21281a9c8e0345dfc6e5c0d3e73e3b780c32a2e0')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"

	install -Dm644 "README-${pkgver}" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
