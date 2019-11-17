# Maintainer: Radioactive Sand <iamrobox001@tutanota.com>
pkgname='python-mywal'
pkgver=0.4
pkgrel=3
pkgdesc="A colorscheme generator that parses Xresources"
arch=('any')
url="https://github.com/iamrobox001/mywal"
license=('GPL')
depends=('python>=3.6')
makedepends=('python-setuptools'
	'python-wheel')
optdepends=('feh: Detecting current wallpaper')
source=("$pkgname-$pkgver.tar.gz::https://github.com/iamrobox001/mywal/archive/${pkgver}.tar.gz"
        "$pkgname-$pkgver-py3-none-any.whl::https://github.com/iamrobox001/mywal/releases/download/${pkgver}/mywal-${pkgver}-py3-none-any.whl")

md5sums=("75dee37bf2bdf439b06a08b024538999"
         "e4f98151f9473519a0c8330ebe9c4eba")

build() {
	cd "mywal-${pkgver}"
	python setup.py build
}

package() {
	cd "mywal-${pkgver}"
	python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE "$pkgdir/usr/share/license/$pkgname/LICENSE"
}
