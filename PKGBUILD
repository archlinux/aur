# Maintainer: 3ED <krzysztof1987@gmail.com>

pkgname=xcursor-semi-transparent
pkgver=2016.04.15
pkgrel=1
pkgdesc="Semi-transparent Cursors Theme"
arch=('any')
url="https://www.opendesktop.org/p/999955/"
license=('GPL')


# wtf?
_hash_time=($(curl -s "$url"|grep -e "hash =" -e "timetamp ="|sed "s/.*= '\(.*\)';/\1/"))

source=(
	"${pkgname}-${pkgver}.tar.gz::https://dl.opendesktop.org/api/files/download/id/1460735324/s/${_hash_time[0]}/t/${_hash_time[1]}/u//74499-semi-transparent.tar.gz"
)
sha256sums=(
	'112b33b255e723a1d37426446763e8ef64d896da1a64bfc2303cce550a1cde63'
)

package() {
	install -m755 -d "${pkgdir}/usr/share/icons"
	cp -R "${srcdir}/semi-transparent" "${pkgdir}/usr/share/icons/"
	chmod -R a=,a+rX,u+w "${pkgdir}/"
}
