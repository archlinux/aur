# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=abhixdd
_pkgname=ghgrab
pkgname=${_pkgname}-bin
pkgdesc="A simple, pretty terminal tool that lets you search and download files from GitHub without leaving your CLI"

pkgver=1.3.2
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux' 'linux-arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'libgcc')

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[1]}")
sha256sums=('ded236a4ed82b8d458106a9de30b5297298eea32e9a8fea6049b09319592641b'
            '2447d1e56a881a12855aa080ed2fcb491b5c23a4dfb72a90c5e591df811615b0')
sha256sums_x86_64=('79c3540e08011c51672ec32797df36e20099c108d8a6a195858848b4f1ef1942')
sha256sums_aarch64=('97074e1af729e1f5e8a945d490c738f79d038fbc4a6b622ba949446c58af6927')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
