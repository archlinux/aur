# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=Squirreljetpack
_pkgname=fist
_execname=fs
pkgname=${_pkgname}-bin
pkgdesc="A fast and intuitive search tool for the filesystem"

pkgver=0.0.3
pkgrel=1
_pkgvername=${pkgver}

arch=('x86_64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('CC-BY-NC-SA-4.0')

provides=("${_execname}")
conflicts=("${_pkgname}")
depends=('glibc' 'libgcc')

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-linux.tar.gz")
sha256sums=('eb2b2358cc28ff629c013c2aeb34b02c0e8daba892aa087409325f66d82810f8'
            '34b241496ca507c10103af63471fd52081840cf79ebc104eba68bc3b6ad0d3ea')
sha256sums_x86_64=('f8b63b41e8d70f8bbe31634243fabcb4ae4ff7bf63b3f211dda5b6198f6ca7ef')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "target/release/${_execname}" "${pkgdir}/usr/bin/${_execname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
