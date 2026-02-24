# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=caffienerd
_pkgname=struct-cli
_appname=${_pkgname%%-cli}
pkgname=${_appname}-bin
pkgdesc="A Rust-based tree alternative that actually respects your sanity"

pkgver=0.5.4
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
sha256sums=('27a9b6e359371af23ebb251bcb3c11326312233fa16471a56369670118626af0')
sha256sums_x86_64=('029cb400f26e534ae1587e5422d27b9e60ea57d0efe70f2f8baf0210b078e3bd')

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
