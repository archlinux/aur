# Maintainer: Rafael Baboni Dominiquini <rafaeldominiquini@gmail.com>

_pkgauthor=laktak
_pkgname=rsyncy
pkgname=${_pkgname}-bin
pkgver=0.2.0
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
source_x86_64=("${_pkgname}_${pkgver}_x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-linux_amd64.tar.gz")
sha256sums=('b04ffed3126b1640db6a77dbf8990785723ffc59d07b808e663830f04768bbf5'
            'a06155a2a9fe6b2cb7b83f9a42f89b5b0e0eb3f70c5a3748feb2cfb99790cf97')
sha256sums_x86_64=('f83a0932dded57469722f5a45f73c47c84193454a6f830e2a6a08928c0461c4c')

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE_${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "README_${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
