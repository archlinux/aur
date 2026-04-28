# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=sreckoskocilic
_gitname=envocabulary
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Forensics and audit toolkit for shell environments"

pkgver=0.3.0
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
sha256sums=('ef0ca3d10cf5d643863486443cf935f2eec53918f5e5032dc27e7392b91ed2ee'
            '9ff9f3810963da568c194ffa007b480c9c66dfc44cbde49c2efcc1fc5508bc37')
sha256sums_x86_64=('08ede5027add2da486ed0fd1e69f78e6fda64b8625d5f985e16f3a210924ce79')
sha256sums_aarch64=('7237c919941b61732f3f6587f311004c27cc668bb0d56688ea468fe222ece089')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "usr/bin/${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
