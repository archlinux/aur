# Maintainer: Drew DeVault <sir@cmpwn.com>
pkgname=knightos-sdk
pkgver=1.9.9
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
sha1sums=('fa48c00261cf6249ff45d12b7083c8204530958d')

package() {
	cd "${srcdir}/sdk-${pkgver}"

	make install DESTDIR="$pkgdir/usr/" PREFIX="/usr/"
}
