# Maintainer: Drew DeVault <sir@cmpwn.com>
pkgname=knightos-sdk
pkgver=2.0.3
pkgrel=2
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
sha1sums=('afffd76b2caa880032c6c2dc21cbb5a7844c86c5')

package() {
	cd "${srcdir}/sdk-${pkgver}"

	make install DESTDIR="$pkgdir/usr/" PREFIX="/usr/"
}
