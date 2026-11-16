# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Borhaneddine GUEMIDI <guemidiborhane at gmail.com>

_gitauthor=peltho
_gitname=tufw
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Terminal UI for ufw"

pkgver=0.2.8
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'i686' 'aarch64')
_barch=('linux_arm64' 'linux_386' 'linux_amd64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

depends=('ufw')

options=('!strip')

source=("LICENSE-${pkgver}::${_ghurlraw}/LICENSE.txt")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[0]}.tar.gz")
source_i686=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[1]}.tar.gz")
source_aarch64=("${_appname}-${arch[2]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[2]}.tar.gz")
sha256sums=('ec499bd869094e1f570e3481d6f59c2866a16358193eaa2f256e33aab60c16d3')
sha256sums_x86_64=('4c556333f3c3bbecf259a245abf895f3dc2a2d6abc330ee99476e043a1f805f8')
sha256sums_i686=('e47ad3a4fbc9f73da577a6290da744b3bc5147d6625863719e4536aac8954081')
sha256sums_aarch64=('e4e4efcd64649e0e5ce69c8ec61b6db3372a6e3c85f17a245bf18977655c1fe2')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
