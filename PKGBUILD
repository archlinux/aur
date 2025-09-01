# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=kenshaw
_pkgname=iv
pkgname=${_pkgname}-cli-bin
pkgver=0.10.1
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
sha256sums_x86_64=('ecdf4dbfa6fe87b3cb190e44ba6c68a8a8931f44ed9265923be1d6c6c3635196')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
