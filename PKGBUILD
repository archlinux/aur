# Maintainer: 
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=python-gps3
_name=${pkgname#python-}
pkgver=0.33.3
pkgrel=3
pkgdesc="Python GPSD interface"
arch=('any')
url="https://github.com/wadda/gps3"
license=('MIT')
depends=('python')
makedepends=('python-installer')
source=("https://files.pythonhosted.org/packages/20/c1/9548cb5388a85e31557d1f1f66e2ad0b269d8aeb982f34f72f83d9bdbaeb/$_name-$pkgver-py2.py3-none-any.whl"
        "https://github.com/wadda/gps3/raw/master/LICENSE")
noextract=("$_name-$pkgver-py2.py3-none-any.whl")
sha256sums=('9c7ef9fa334ae6d4157fa63abe6df334d4f0878dbb628d10cb4c5f304eb22978'
            '79b976c5c314ca8828c95deb8a2c9cc28f1c93b0c74f4e6dd1dbe0ff8b972288')

prepare() {
  mkdir -p dist
  cp -f "$_name-$pkgver-py2.py3-none-any.whl" dist/
}

package() {
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
