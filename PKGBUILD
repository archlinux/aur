# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=Hemanth2332
_gitname=tuitify
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Terminal music player"

pkgver=0.1
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('linux_mac')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'zlib' 'vlc' 'yt-dlp')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_gitname}_${_barch[0]}")
sha256sums=('b72178aa990fb77b68c54891f4ca36e25acdb2ae2d28a09fad4d7e23d02d8e91'
            '62f67d6a3de6ea61ff3b5a20d045f49a66b555f7dc904699b69d91468cc38ac9')
sha256sums_x86_64=('08da1bc57e665e8b0d968e876230741b8507c07cbc3a4f1ef298097baab1bb01')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
