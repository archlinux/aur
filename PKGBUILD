# Maintainer: Samuel Vincent Creshal <samuel@creshal.de>

pkgname=yspave
pkgver=0.0.10
pkgrel=3
pkgdesc='Simple scrypt-based CLI password manager'
arch=('any')
url='https://dev.yaki-syndicate.de'
license=('GPL')
depends=('python' 'python-colorama' 'python-crypto' 'python-scrypt' 'python-xdg')
optdepends=('xsel: access to X selection'
            'words: Random word generator as per XKCD 936')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/creshal/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('3c8aad72dacf799fc5a45a49d6fe00cc7c14bbbb7e7670df46480d683cdbda1d7155c2c6be8973a816a4bf408c12b7b6f6d121a3203e7274f22fca4ec6b9c231')

package () {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python setup.py bdist -d "${pkgdir}"
	cd "${pkgdir}"
	tar -xf *.tar*
	rm *.tar*
}
