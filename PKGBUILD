# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=sreckoskocilic
_gitname=envocabulary
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Forensics and audit toolkit for shell environments"

pkgver=1.0.5
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'i686' 'aarch64')
_barch=('linux_amd64' 'linux_386' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tzst::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[0]}.pkg.tar.zst")
source_linux_386=("${_appname}-${arch[1]}-${pkgver}.tzst::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[1]}.pkg.tar.zst")
source_aarch64=("${_appname}-${arch[2]}-${pkgver}.tzst::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[02]}.pkg.tar.zst")
sha256sums=('84c3462ce12f000e53d14255a6141b460436a3d07ab93eb01cd7ec9f8a082d1d'
            '9ff9f3810963da568c194ffa007b480c9c66dfc44cbde49c2efcc1fc5508bc37')
sha256sums_x86_64=('b016e248dcac43f00b11542487f98e7d78f48747bad67632137c685b5f58ab11')
sha256sums_aarch64=('98a36a28791408dab6187409a4b37c447814fb01b434f43ae4e174cadf209f10')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "usr/bin/${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
