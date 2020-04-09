# Maintainer: 3ED <krzysztof1987@gmail.com>

pkgname=xcursor-semi-transparent
pkgver=2016.04.15
pkgrel=2
pkgdesc="Semi-transparent Cursors Theme"
arch=('any')
url="https://www.pling.com/p/999955/"
license=('GPL')
makedepends=('perl')

# Wtf? And they change it again... Hope this works for you...
_source=$(curl -s "$url" | perl -n -e 's/.*var filesJson.*"url":"(.*?)".*/$1/ && s/%([0-9A-Fa-f]{2})/chr(hex($1))/eg && print')

source=(
	"${pkgname}-${pkgver}.tar.gz::${_source}"
)

sha256sums=(
	'112b33b255e723a1d37426446763e8ef64d896da1a64bfc2303cce550a1cde63'
)

package() {
	install -m755 -d "${pkgdir}/usr/share/icons"
	cp -R "${srcdir}/semi-transparent" "${pkgdir}/usr/share/icons/"
	chmod -R a=,a+rX,u+w "${pkgdir}/"
}
