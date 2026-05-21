# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=Ataraxy-Labs
_gitname=lazydiff
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A fast terminal UI for reviewing Git diffs"

pkgver=0.1.0
pkgrel=7
_gitversion=v${pkgver}-alpha.${pkgrel}

arch=('x86_64')
_barch=('linux-x86_64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc' 'openssl' 'zlib')

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.tar.gz")
sha256sums=('d17af4e97b8ef8e0ac0907eb89f080ab5e55f3863b951a34a65a20d6fcb84810'
            'ac1c162eee0bc8161b18d934bb406dae9d7624a261fbb7bf58d4aeb7ea1736b8')
sha256sums_x86_64=('43774b9121142cf9896e8948d56081f79478db172b502dd054dc15815830976b')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
