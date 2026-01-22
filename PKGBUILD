# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=kenshaw
_pkgname=iv
pkgname=${_pkgname}-cli-bin
pkgver=0.11.1
pkgrel=1
pkgdesc="A command-line image viewer using terminal graphics (Sixel, iTerm, Kitty)"
arch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}" "openimageio")
depends=('glib2' 'libvips' 'glibc' 'gcc-libs')

source=("README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64.tar.bz2")
sha256sums=('027a81f3244c2b7722e24ec7bc4e97e40dd6e5b9bf9f892e26952109d15043b0')
sha256sums_x86_64=('d9cf1ad46422c04a15d353495cb88efcefcbcb0a006b3ae1aaa1597135a43c2c')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
