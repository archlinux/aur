# $Id: PKGBUILD 272039 2017-12-03 19:51:27Z jelle $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Roberto Alsina <ralsina@kde.org>

pkgname=uniconvertor
pkgver=1.1.5
pkgrel=8
pkgdesc="A universal vector graphics translator using sK1 engine."
arch=('x86_64')
url="https://sk1project.net/modules.php?name=Products&product=uniconvertor&op=download"
license=('GPL')
depends=('python2' 'python2-pillow' 'python2-reportlab' 'sk1libs')
source=("https://sk1project.net/dc.php?target=uniconvertor-$pkgver.tar.gz")
md5sums=('d1272315a58304ece2ff588834e23f72')

build() {
  cd "$srcdir/uniconvertor-$pkgver"

  # python2 fix
  sed -i 's_#! /usr/bin/python_#! /usr/bin/python2_' src/__init__.py

  python2 setup.py build
}

package() {
  cd "$srcdir/uniconvertor-$pkgver"
  python2 setup.py install --root="$pkgdir"
}
