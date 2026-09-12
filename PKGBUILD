# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=ozgurulukir
_pkgname=fff.cr
_appname=${_pkgname//\./-}
pkgname=${_appname}-bin
pkgver=0.3.3
pkgrel=1
_pkgver=v${pkgver}
pkgdesc="📁 A simple file manager written in Crystal."

url="https://github.com/${_pkgauthor}/${_pkgname}"
license=('MIT')
arch=('any')

provides=("${_appname}")
conflicts=(${pkgname%%-bin})

depends=('glibc' 'libgcc' 'pcre2' 'readline')

source=("https://github.com/${_pkgauthor}/${_pkgname}/archive/${_pkgver}.tar.gz")
sha256sums=('9f6a98c4c5052230e54e2c949bdd916789a872c52b80fe0c859afd67cfad4ea2')


package() {
	cd "${srcdir}/${_pkgname}-${pkgver}" || exit

	install -Dm755 "bin/${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "man/${_appname}.1" "${pkgdir}/usr/share/man/man1/${_appname}.1"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
