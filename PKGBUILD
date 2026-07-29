# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=sreckoskocilic
_gitname=envocabulary
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Forensics and audit toolkit for shell environments"

pkgver=1.0.3
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
sha256sums=('ad0acab668cb609eb06b24168b15d21925087b095bb91790d74a3666ebc1674e'
            '9ff9f3810963da568c194ffa007b480c9c66dfc44cbde49c2efcc1fc5508bc37')
sha256sums_x86_64=('c9e9d2a555b9628730e93aa2c3be14daacb78fa1aa988cb6108de686d3478e8f')
sha256sums_aarch64=('56642d558d4c8608dbfcc6b97ecf5547ea9614a727eadcbd2bcbbf38cb617cb4')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "usr/bin/${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
