# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=dgr8akki
_gitname=nano-ffmpeg
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Wraps the full power of FFmpeg in a beautiful, keyboard-driven terminal dashboard"

pkgver=0.4.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

depends=('ffmpeg')
provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[1]}.tar.gz")
sha256sums_x86_64=('1942c32c039841b276c5b3bcfb271c3e11741c1d0c799629cf5a0e3518ad1a86')
sha256sums_aarch64=('e3362f77d4509e6e109ff7393f4216db7758fdfbb3902295b8ce0e72c6bfd60b')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
