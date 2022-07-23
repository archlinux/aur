# Maintainer: Guillaume Hayot <postblue@postblue.info>
# Author: Kjö Hansi Glaz <kjo@a4nancy.net.eu.org>
# TODO: Fix broken help page

pkgname=bookletimposer
pkgver=0.3.1
pkgrel=1
pkgdesc="Achieve some basic imposition on PDF documents"
arch=('any')
url="http://kjo.herbesfolles.org/bookletimposer/"
license=('GPLv3+')
depends=('python>=3.5' 'python-pypdf2>=1.26' 'python-gobject' 'desktop-file-utils')
makedepends=('python-distutils-extra' 'pandoc')
install=bookletimposer.install
source=("https://git.codecoop.org/kjo/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('dbe93e90970c4862fa8b391ae62543463a902eba22e51784f7295daab02257cfc7a15d27d1fdad089637346ec2644c893d6d36c3920cb48e4a7ae381475ca1c1')

build() {
        cd "$pkgname-$pkgver"
        python setup.py build
}

package() {
        cd "$pkgname-$pkgver"
        python setup.py install --prefix=/usr --root="$pkgdir" --optimize 1
        ln -s /usr/share/pixmaps/bookletimposer.svg $pkgdir/usr/share/bookletimposer/bookletimposer.svg
}
