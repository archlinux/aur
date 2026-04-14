# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=KrishnaSSH
_gitname=gophertube
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Minimal terminal YouTube client with mpv, fzf, and chafa previews"

pkgver=2.8.2
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'i686' 'aarch64')
_barch=('linux-amd64' 'linux-386' 'linux-arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('GPL-3.0-only')

provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_barch[0]}-${_gitversion}")
source_i686=("${_appname}-${arch[1]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_barch[1]}-${_gitversion}")
source_aarch64=("${_appname}-${arch[2]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_barch[2]}-${_gitversion}")
sha256sums=('58ff572becef948aa1b97639766bc256297d4453e96caeb85751dc6f6bce5b90'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('bb60e249f333b70039f05a8789506b25e8dde4cf3e06fedb178b1ff6098b60e0')
sha256sums_i686=('4a05a4ce9f07a410b405c482b602c314778e77d56db7ef249238995af0b48adf')
sha256sums_aarch64=('e1c3132c2bfb58533b85ea0cfe04c27bfddad07f96bbacf9a6a0913ffc3b0f94')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
