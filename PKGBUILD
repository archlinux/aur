# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>
# Co-Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-gps3
_name=${pkgname#python-}
pkgver=0.33.3
pkgrel=1
pkgdesc="Python 2.7 - 3.5 interface to gpsd"
arch=('any')
url="https://github.com/wadda/gps3"
license=('MIT')
depends=('python')
makedepends=('python-pip')
install="$_name.install"
source=("https://files.pythonhosted.org/packages/20/c1/9548cb5388a85e31557d1f1f66e2ad0b269d8aeb982f34f72f83d9bdbaeb/$_name-$pkgver-py2.py3-none-any.whl"
        "https://github.com/wadda/gps3/raw/master/LICENSE")
sha256sums=('9c7ef9fa334ae6d4157fa63abe6df334d4f0878dbb628d10cb4c5f304eb22978'
            '79b976c5c314ca8828c95deb8a2c9cc28f1c93b0c74f4e6dd1dbe0ff8b972288')


package() {
	PIP_CONFIG_FILE=/dev/null pip install \
		--isolated \
		--root="$pkgdir" \
		--ignore-installed \
		--no-deps *.whl

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
