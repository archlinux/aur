# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: wenLiangcan <boxeed at gmail dot com>
# Contributor: tee < teeaur at duck dot com >

_gitauthor=barakplasma
_gitname=websocketd
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Like inetd, but for WebSockets. Turn any application that uses STDIO/STDOUT into a WebSocket server."

pkgver=0.4.2
pkgrel=1
_gitversion=${pkgver}

arch=('x86_64' 'i686' 'aarch64')
_barch=('linux_amd64' 'linux_386' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('BSD-2-Clause')

depends=('glibc')
provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_gitversion}_${_barch[0]}.tar.gz")
source_i686=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_gitversion}_${_barch[1]}.tar.gz")
source_aarch64=("${_appname}-${arch[2]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_gitversion}_${_barch[2]}.tar.gz")
sha256sums=('2eb09d819b06741f2240a3035fdd23d1ce49b05dcd40bcb4d59fbfe9f1c3a952'
            '4ff156fac66b6f7e5801a90e06dea6fd13a7b10327cb60aad6a49f36c26650f0')
sha256sums_x86_64=('4c2c14622bb5603c688499fad3945f256de103f924763bc3904443a36ed5f890')
sha256sums_i686=('8a383c492c83c413e8511ba1ac762b53e4b54584751f0b93322024ffc1e56318')
sha256sums_aarch64=('b8fe2fb460882cf2382e9f53dd6fca130a78774648a24f0797f6ec074afdec13')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
