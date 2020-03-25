# Maintainer: Guillaume Hayot <postblue@postblue.info>
# Author: Kjö Hansi Glaz <kjo@a4nancy.net.eu.org>
# TODO: Fix broken help page

pkgname=bookletimposer
pkgver=0.3
pkgrel=1
pkgdesc="Achieve some basic imposition on PDF documents"
arch=('any')
url="http://kjo.herbesfolles.org/bookletimposer/"
license=('GPLv3+')
depends=('python>=3.5' 'python-pypdf2>=1.26' 'python-gobject' 'desktop-file-utils')
makedepends=('python-distutils-extra' 'pandoc')
install=bookletimposer.install
source=("http://kjo.herbesfolles.org/bookletimposer/archive/$pkgname-$pkgver.tar.gz")
md5sums=('2e8d34829f5873590b41d4fe309e4ee0')

build() {
        cd "$pkgname-$pkgver"
        python setup.py build
}

package() {
        cd "$pkgname-$pkgver"
        python setup.py install --prefix=/usr --root="$pkgdir" --optimize 1
        ln -s /usr/share/pixmaps/bookletimposer.svg $pkgdir/usr/share/bookletimposer/bookletimposer.svg
}
