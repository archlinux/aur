# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=kapilpokhrel
_gitname=regexplain
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A terminal UI for explaining and visualizing regular expressions, kindof like regex101."

pkgver=1.0.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('x86_64-unknown-linux-gnu')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc')

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.tar.gz")
sha256sums=('7e0bbc7a6db54037296ff075adc22e0c4cc7d71512565be472590c1e88f6aabe'
            '97985f2275c36adda6fbce381dc440b363425d6256d5fbfcc8b6b854f57f05b7')
sha256sums_x86_64=('51ec5ca208c766c788da7943502634d27f79cda724a85826289476fcc3cb93b5')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
