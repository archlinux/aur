# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=Ars-byte
_gitname=Imgview
_appname=${_gitname,,}
pkgname=${_appname}-bin
pkgdesc="Image viewer for tty in C++"

pkgver=1.0
pkgrel=1
_gitversion=${pkgver}

arch=('x86_64')
_barch=('x86_64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

depends=('glibc' 'libgcc' 'libstdc++')

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.tar.gz")
sha256sums=('941b29fd967a88631ea161737610d27e1388c6693df5a236a169a968a389fe67'
            'af5a037bba0b2ccb70e9258bec14e7f6bc0f4295dcff9a3c067e6ee9c47e0328')
sha256sums_x86_64=('36851d7d6a00f5f56b4eaa89f59469aea169e4ffcd279e0c0f17e6e3763ae30f')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
