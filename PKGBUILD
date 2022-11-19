# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Chris Brannon <cmbrannon79@gmail.com>
# Contributor: Geoffroy Carrier <geoffroy.carrier@aur.archlinux.org>
# Contributor: Arvid Ephraim Picciani <aep@exys.org>
# Contributor: Michael Krauss <hippodriver@gmx.net>

pkgname=python38-pyparsing
pkgver=3.0.9
pkgrel=1
pkgdesc='General parsing module for Python'
arch=('any')
url='https://github.com/pyparsing/pyparsing/'
license=('MIT')
depends=('python38')
makedepends=('python38-build' 'python38-installer' 'python38-flit-core')
checkdepends=('python38-jinja' 'python38-railroad-diagrams')
optdepends=('python38-railroad-diagrams: for generating Railroad Diagrams'
            'python38-jinja: for generating Railroad Diagrams')
source=("https://github.com/pyparsing/pyparsing/archive/pyparsing_$pkgver.tar.gz")
sha512sums=('1158f27e31f8eced540217b7234b09005eac416fad74faf59678fdae93fe2f76e0e3b5f4adfd3ceb42c8aef19150950293e989c9a5189741175073eb7a03cd6d')

build() {
  cd pyparsing-pyparsing_$pkgver
  python3.8 -m build -nw
}

check() {
  cd pyparsing-pyparsing_$pkgver
  python3.8 -m unittest
}

package() {
  cd pyparsing-pyparsing_$pkgver
  python3.8 -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:
