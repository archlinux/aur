# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=caffienerd
_pkgname=struct-cli
_appname=${_pkgname%%-cli}
pkgname=${_appname}-bin
pkgdesc="A Rust-based tree alternative that actually respects your sanity"

pkgver=0.3.2
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
sha256sums=('d540f72df09609fa46b701927982e48daedc372a844903070c6aa778032bd73c')
sha256sums_x86_64=('65db64b394f2053763dabfc614e3c2408573e0ad2142063630eeefbe6a67a915')

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
