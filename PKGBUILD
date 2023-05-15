# Maintainer: Guillaume Hayot <postblue@postblue.info>
# Author: Kjö Hansi Glaz <kjo@a4nancy.net.eu.org>

pkgname=bookletimposer
pkgver=0.3.1
pkgrel=2
epoch=1
pkgdesc="Achieve some basic imposition on PDF documents"
arch=('any')
url="http://kjo.herbesfolles.org/bookletimposer/"
license=('GPLv3+')
depends=('python>=3.5' 'python-pypdf2>=1.26' python-gobject desktop-file-utils)
makedepends=(python-build python-installer python-wheel python-distutils-extra python-setuptools pandoc)
install=bookletimposer.install
source=("http://deb.debian.org/debian/pool/main/b/${pkgname}/${pkgname}_${pkgver}.orig.tar.xz")
b2sums=('64831443421b3d3cdc337091111bcbb76fdae7c2ab3ad459a36ef89ad1c289619a8a1e85a490cf94f43843dc55de25fa26baee30b566c1f7786931a7bb7dbda0')

build() {
        cd "$pkgname-$pkgver"
        python -m build --wheel --no-isolation
}

package() {
        cd "$pkgname-$pkgver"
        python -m installer --destdir="$pkgdir" dist/*.whl
        ln -s /usr/share/pixmaps/bookletimposer.svg $pkgdir/usr/share/bookletimposer/bookletimposer.svg
}
