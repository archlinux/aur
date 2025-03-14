# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=mhausenblas
_pkgname=cinf
pkgname=${_pkgname}-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="Command line tool to view namespaces and cgroups"
arch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('Apache-2.0')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_linux_arm64.tar.gz")
sha256sums=('b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1'
            '893f02e71647c8432c88fb714d3741494baa76e868d17e6eea58f6bf1c13dd85')
sha256sums_x86_64=('38edea95fdcacfaf5e26b675e2d238db2c5ed44f2f5692bce7751eb6078ef7c0')
sha256sums_aarch64=('6ff0daf9bb19dc1b97022b924554e73725d37191f428a0a58bce6a4986804022')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"

	install -Dm644 "README-${pkgver}" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
