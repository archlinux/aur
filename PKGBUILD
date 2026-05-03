# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=kryptic-sh
_gitname=sqeel
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Fast, vim-native SQL client. No Electron. No JVM. No bullshit."

pkgver=0.2.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('x86_64-unknown-linux-gnu')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url='https://sqeel.kryptic.sh/'

license=('MIT')

depends=('glibc')
provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_gitversion}-${_barch[0]}.tar.gz")
sha256sums=('c857e2899b5d9844d91923a6834a563390fab94c49d4e683e28f5a20f9386683'
            '1a8f80abbddbd9a9f254530a9941f385e1dcdb3af2f0b335e771bcbd47022ad2')
sha256sums_x86_64=('bfef0dc3e9727f6d9b825a7be6912ef1a862bda80db45954e8f3c4b85af8a031')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
