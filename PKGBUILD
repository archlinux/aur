# Maintainer: Rafael Baboni Dominiquini <rafaeldominiquini@gmail.com>

_pkgauthor=laktak
_pkgname=rsyncy
pkgname=${_pkgname}-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="A status/progress bar for rsync"
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64')
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")
depends=('rsync')
source=("LICENSE_${pkgver}::${_urlraw}/LICENSE"
		"README_${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}_${pkgver}_x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64.tar.gz")
sha256sums=('b04ffed3126b1640db6a77dbf8990785723ffc59d07b808e663830f04768bbf5'
            'b02e96a842c1f5d8806d813f29539f2e2fcd2bc0b64169cf9dc1f29ba8bfd334')
sha256sums_x86_64=('f7185fe90213b8bb397a2daedb946ca7babae163a399f0e86dd5e102ab90ef94')

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE_${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "README_${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
