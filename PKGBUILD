# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=caffienerd
_pkgname=struct-cli
_appname=${_pkgname%%-cli}
pkgname=${_appname}-bin
pkgdesc="A Rust-based tree alternative that actually respects your sanity"

pkgver=0.4.2
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_appname}")
conflicts=("${_pkgname}")
depends=('glibc' 'libgcc' 'zlib' 'openssl')

source=("README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${pkgname}-${pkgver}::${url}/releases/download/${_pkgvername}/${_appname}")
sha256sums=('aaf165b5376e4a42ad0f30b6db2250ea182b945fceded0ba16d2f47dd6700c88')
sha256sums_x86_64=('560069da2f97dc0f856ebc58c0395b52b68904a7670f8a4e9c26117fe34c2271')

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
