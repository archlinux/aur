# Maintiner  : David Phillips < dbphillipsnz gmail >
# Contributor: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

_pkgname=blind
pkgname=${_pkgname}-git
pkgver=r176.da24af3
pkgrel=1
pkgdesc="Suckless command line video editor"
arch=('x86_64' 'i686')
url="http://tools.suckless.org/blind/"
license=('custom:ISC')
depends=('ffmpeg')
optdepends=('imagemagick: support for other images formats than farbfeld and PAM')
makedepends=('git')
source=("${pkgname}::git://git.suckless.org/${_pkgname}")
sha256sums=('SKIP')

pkgver() {
	cd "${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${pkgname}"
	make PREFIX=/usr
}

package() {
	cd "${srcdir}/${pkgname}"
	make install PREFIX=/usr DESTDIR="${pkgdir}"
}
