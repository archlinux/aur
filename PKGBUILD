# Maintainer: Samuel Vincent Creshal <samuel@creshal.de>

pkgname=yspave
pkgver=0.1.2
pkgrel=2
pkgdesc='Simple scrypt-based CLI password manager'
arch=('any')
url='https://dev.yaki-syndicate.de'
license=('GPL')
depends=('python' 'python-colorama' 'python-pycryptodome' 'python-scrypt' 'python-xdg')
optdepends=('xsel: access to X selection'
            'words: Random word generator as per XKCD 936')
makedepends=('python-setuptools')
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/creshal/$pkgname/archive/$pkgver.tar.gz"
	"https://github.com/creshal/yspave/releases/download/$pkgver/$pkgname-$pkgver.tar.gz.asc"
)
sha512sums=(
	'60b9beca9dc603526f6b2bcf3b8f3552694040a93e4f5819cd06a323a68d44e8489db97699db528c2809b39cb2df83fa176ec5e5074bafb3e1d512ff2a6b8070'
	'67161f913d274f1681b52e548e8df92430fbcc537f0600df753d42eb5d06bc8bdbf6704cd3f32f2eeafd2f0e7c415bec2173cda04fbdeccb6483e27c433824d0'
)
validpgpkeys=('6992814F5117E21BB52A6C14D828F2B98DE7B0D6' 'C24FF235C918C314536DFE12C49D7AC06138A8E4')

package () {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python setup.py bdist -d "${pkgdir}"
	cd "${pkgdir}"
	tar -xf *.tar*
	rm *.tar*
}
