# Maintainer: Drew DeVault <sir@cmpwn.com>
pkgname=knightos-sdk
pkgver=2.0.9
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
sha1sums=('3fe1e0c4c03f0c9b69c11f69161226c3db525c29')

package() {
	cd "${srcdir}/sdk-${pkgver}"

	python3 setup.py install --root="$pkgdir/" --optimize=1
}
