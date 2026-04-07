# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=roniel-rhack
_gitname=rondo
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A modern terminal productivity app that combines task management with a daily journal"

pkgver=0.7.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64')
_barch=('amd64')

url="https://github.com/${_gitauthor}/${_gitname}"
_urlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_pkgvername}"

license=('MIT')

depends=('glibc')
provides=("${_appname}")
conflicts=("${_appname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_gitname}-linux-${_barch[0]}.tar.gz")
sha256sums=('1654036be573fb23122c21f88006be1458b6f6c0a59ccab4501fc10af0a104cc'
            '45988c986701b3a4f26604ddb89c2175768931a9266000effde8cf0e8641f15f')
sha256sums_x86_64=('44898bfb9100dd493e1f05d401f925ea60fe1e6c9af1f16fb2806078d5047016')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
