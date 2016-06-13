# Maintainer: Samuel Vincent Creshal <samuel@creshal.de>

pkgname=yspave
pkgver=0.1.1
pkgrel=1
pkgdesc='Simple scrypt-based CLI password manager'
arch=('any')
url='https://dev.yaki-syndicate.de'
license=('GPL')
depends=('python' 'python-colorama' 'python-crypto' 'python-scrypt' 'python-xdg')
optdepends=('xsel: access to X selection'
            'words: Random word generator as per XKCD 936')
makedepends=('python-setuptools')
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/creshal/$pkgname/archive/$pkgver.tar.gz"
	"$pkgname-$pkgver.tar.gz.asc::https://github.com/creshal/yspave/releases/download/$pkgver/$pkgver.tar.gz.asc"
)
sha512sums=(
	'b3798231a8a5bbb8187f7b14b42c5e075d3c93cc0c77d3344ba8ffcb6516cc489e5715e5d38e8fc07d836c70391ec12d9a7b4df1db22ba63ce9c4e16912161f1'
	'4fb4d6b71f9795e661418cf8dcb2d080ff657548d9a9f23e39c3e9e9a1af2439fd272be727ca69e7a1574ca3130fcc6e1afe6d82df43b684df230d20d02062c6'
)
validpgpkeys=('6992814F5117E21BB52A6C14D828F2B98DE7B0D6')

package () {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python setup.py bdist -d "${pkgdir}"
	cd "${pkgdir}"
	tar -xf *.tar*
	rm *.tar*
}
