# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=unhappychoice
_pkgname=splashboard
pkgname=${_pkgname}-bin
pkgver=1.1.1
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="A customizable terminal splash screen with plugin-based data sources"
arch=('x86_64' 'aarch64')
_barch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('ISC')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('gcc-libs' 'glibc' 'zlib' 'git')

source=("README-${pkgver}.md::${_urlraw}/README.md"
        "LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-${_barch[0]}-unknown-linux-gnu.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-${_barch[1]}-unknown-linux-gnu.tar.gz")
sha256sums=('d1dc133758f29614f280e4bf43adc5fc46425122af5b3dc1a62440fc1a430dfe'
            '16e5a239e6cb767747480dfd5707228219403b7ee0b02b9ea1b1f39f8819b1d7')
sha256sums_x86_64=('db6f53f6181f45424b607c1fc021e057852d60c74c17fb7106bb2d2750a3bd74')
sha256sums_aarch64=('3dd808ed9849dd4c2836ed3f490ee8b982e492953ebed9f7d1b109b03c39dbda')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
