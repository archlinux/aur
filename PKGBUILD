# Maintainer: Guillaume Hayot <postblue@postblue.info>
# Author: Kjö Hansi Glaz <kjo@a4nancy.net.eu.org>

pkgname=bookletimposer
pkgver=0.3
pkgrel=1
epoch=1
pkgdesc="Achieve some basic imposition on PDF documents"
arch=('any')
url="http://kjo.herbesfolles.org/bookletimposer/"
license=('GPLv3+')
depends=('python>=3.5' 'python-pypdf2>=1.26' python-gobject desktop-file-utils)
makedepends=(python-build python-installer python-wheel python-distutils-extra pandoc)
install=bookletimposer.install
source=("https://kjo.herbesfolles.org/$pkgname/archive/$pkgname-$pkgver.tar.gz")
b2sums=('c78bf2e8c11e6003beba9e8565002037aec6089868b82aacf2f3a0b6184c96ce3cbb7cfa53b45f992f12f7496cca5c6ca177394cdca2c15a16682456775a721b')

build() {
        cd "$pkgname-$pkgver"
        python -m build --wheel --no-isolation
}

package() {
        cd "$pkgname-$pkgver"
        python -m installer --destdir="$pkgdir" dist/*.whl
        ln -s /usr/share/pixmaps/bookletimposer.svg $pkgdir/usr/share/bookletimposer/bookletimposer.svg
}
