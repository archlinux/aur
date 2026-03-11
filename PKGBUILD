# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=bahdotsh
_pkgname=mdterm
pkgname=${_pkgname}-bin
pkgdesc="A terminal-based Markdown viewer written in Rust. Renders Markdown files with syntax highlighting, styled formatting, and interactive navigation"

pkgver=1.0.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-gnu' 'aarch64-unknown-linux-gnu')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'libgcc')

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[1]}.tar.gz")
sha256sums=('3804af05344dc421dccdb99641b99e95b886055e5659f92839dc0b856371cbb1'
            'e2d8bb4e653bd3868b02a3265b104952401722d688adedac5e4c1d4d1f2794ec')
sha256sums_x86_64=('103a624236d902370d5224e4b16d24e5d9418f8caec8c74a829b425c51573ffd')
sha256sums_aarch64=('f40c38f6517bc4f7bafc39828683adc46df8000ee92b7646990764ff8a9366c3')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
