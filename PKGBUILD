# Maintainer: Samuel Vincent Creshal <samuel@creshal.de>

pkgname=yspave
pkgver=0.1.0
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
	"$pkgname-$pkgver.tar.gz.asc::https://github.com/creshal/yspave/releases/download/0.1.0/0.1.0.tar.gz.asc"
)
sha512sums=(
	'66c34df6950a1f02d3b7c4c0f618e4a1b44355be25e64f8a8027ddcfc882015b9aa56cad573102840bb8969bf003d21ac00e1be04ff22f58d4a7ed580b14dad5'
	'5a5f6f91aec011ca5a7a912a7d40843d18b83c004e5bb97b4e096597753f98e60d7d0b6af8fc1bee61be51ad6ca217f2eef5f11b8dd0d7036d50b085a92b2958'
)
validpgpkeys=('6992814F5117E21BB52A6C14D828F2B98DE7B0D6')

package () {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python setup.py bdist -d "${pkgdir}"
	cd "${pkgdir}"
	tar -xf *.tar*
	rm *.tar*
}
