# Maintainer: Tom Stroobants <stroobantstom@gmail.com>
pkgname=willekeur-git
_command=willekeur
pkgver=1.0.0
pkgrel=1
pkgdesc="On call will change the background to a Google Earth image"
arch=("any")
url="https://github.com/stroobantstom/willekeur"
license=('MIT')
depends=('curl')

source=("$pkgname"::"git+https://github.com/stroobantstom/willekeur.git")

md5sums=('SKIP') #autofill using updpkgsums


pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'  
}

package() {
	cd "${srcdir}/${pkgname}"

	install -Dm755 willekeur.sh "${pkgdir}/usr/bin/${_command}"
	install -Dm755 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}