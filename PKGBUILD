# Maintainer: Reed Law

pkgname=python-memacs
pkgver=2022.8.6
pkgrel=00
pkgdesc='Visualize your (digital) life in Emacs Org mode by converting data to Org mode format'
arch=(any)
url=https://github.com/novoid/memacs
license=(GPL)
depends=('python>=3.6')
makedepends=(python-pip)
source=("$pkgname-$pkgver.zip::$url/archive/refs/heads/master.zip")
sha256sums=(4bf40f1cd2f31cfe6fc5cd2898cee901cfb66a1952b64285c30d7d3f3e2f439a)

build() {
  cd Memacs-master
  python setup.py build
}

package() {
  cd Memacs-master
  python setup.py install --optimize=1 --root="${pkgdir}/"
  install -D -m644 license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
