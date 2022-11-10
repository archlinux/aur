# Maintainer: peippo <christoph+aur@christophfink.com>

# pkgname=("otf-oswald" "ttf-oswald")
pkgname="otf-oswald"
pkgver=20171111
pkgrel=1
pkgdesc="A reworking of the classic gothic typeface style"
arch=("any")
url="https://fonts.google.com/specimen/Oswald"
license=("OFL")

_github_user="kalapi"
_github_repo="OswaldFont"
_commit="3a60304775def3f01576d014919f094c9edd5c61"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${_github_user}/${_github_repo}/archive/${_commit}.tar.gz")
b2sums=('0e2710547e97ce59dd65166fcdcca97a4eeab702ddb10fb86f203ab2575755dcb59d1bbee2eba2c70d49f09276c1139e1a846c0fb97826c39962f993d65fe41d')

_package() {
	cd "${srcdir}/${_github_repo}-${_commit}/"
	install -Dm644 fonts/$1/* -t "$pkgdir/usr/share/fonts/$pkgname/"
	install -Dm644 OFL.txt    -t "$pkgdir/usr/share/licenses/$pkgname/"
}

# package_ttf-oswald() {
# 	conflicts=(otf-oswald)
# 	_package otf
# }

package_otf-oswald() {
	conflicts=(ttf-oswald)
	_package ttf
}
