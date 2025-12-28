# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=markallenbattey
_pkgname=Newbie
_appname=${_pkgname,,}
pkgname=${_appname}-bin
pkgdesc="A simple command-line tool for file processing, text manipulation, and automation"

pkgver=1.0.8
pkgrel=1
_pkgvername=${pkgver}

arch=('x86_64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('custom:Newbie	')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'gcc-libs')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.txt")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_appname}")
sha256sums=('3b275114be621f552fc5ce95a460e4307b8d6b607a756f51e5fb316586fac9db'
            '3c3337d4f426e9d043a6cfaafc874e9abeca34cfa022f08e2f01563efac49012')
sha256sums_x86_64=('b595c95f34eb843956bc60a24e77f2a866e5567b0fd6858746418e5e3bb30eeb')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${arch[0]}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
