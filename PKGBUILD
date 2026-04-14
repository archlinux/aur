# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=KrishnaSSH
_gitname=gophertube
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Minimal terminal YouTube client with mpv, fzf, and chafa previews"

pkgver=2.8.1
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
sha256sums=('4ab1eb2c14bcab70384696678a3626d2463bd849845a87d801f37b85bddafa38'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('8d527df64b85988fdcb82a92c2959d77727f1949a493f51a266afe61c93bf129')
sha256sums_i686=('9884e5b03362385255cd4826ea237cda409d357d1840b96c51b0fa73c2f97b64')
sha256sums_aarch64=('610bf9d32691f5b6d1fed39019cbf5d56355676ac29ecd91685a761a0a9caf2d')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
