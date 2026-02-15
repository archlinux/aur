# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=caffienerd
_pkgname=struct-cli
_appname=${_pkgname%%-cli}
pkgname=${_appname}-bin
pkgdesc="A Rust-based tree alternative that actually respects your sanity"

pkgver=0.3.1
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
source_x86_64=("${pkgname}-${pkgver}::${url}/releases/download/${_pkgvername}/${_appname}-linux")
sha256sums=('01202df421c117c045abd6cd60143f43f16ff3239fe3aeec2364f35ab873ba68')
sha256sums_x86_64=('440efbbc9c0c334f3f2aae23fbfb9509fffec01525323963f04271175e1b5ded')

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
