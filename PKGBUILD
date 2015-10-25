# Maintainer: Drew DeVault <sir@cmpwn.com>
pkgname=knightos-sdk
pkgver=1.9.4
pkgrel=1
license=('MIT')
pkgdesc='The KnightOS developer SDK'
depends=(
	"python" "python-requests" "python-docopt"
	"genkfs" "kpack" "sass" "z80e"
	"python-yaml" "python-pystache" "kimg"
	"knightos-kcc" "scas"
)
optdepends=(
	"git: version control support"
	"mercurial: version control support"
)
arch=(i386 x86_64)
url='https://github.com/KnightOS/sdk'
source=("https://github.com/KnightOS/sdk/archive/${pkgver}.tar.gz")
sha1sums=('1838da3109c442f7ea9fd7cfd528f0a67f380ccd')

package() {
	cd "${srcdir}/sdk-${pkgver}"

	make install DESTDIR="$pkgdir/usr/" PREFIX="/usr/"
}
