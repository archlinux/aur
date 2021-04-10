# Maintainer: Daniel Playfair Cal <daniel.playfair.cal@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: Aaron Schaefer <aaron@elasticdog.com>

pkgname=python2-boto
pkgver=2.49.0.20190327
_commit=9e1cd3bd76e738d80630f1bd9160fd87c8eab865
pkgrel=5
pkgdesc='A Python interface to Amazon Web Services (AWS) (python2)'
arch=('any')
url='https://github.com/boto/boto'
license=('MIT')
depends=('python2')
makedepends=('python2-setuptools')
source=("$pkgname-$_commit.tar.gz::https://github.com/boto/boto/archive/$_commit.tar.gz")
sha512sums=('a68b7560caef3328970b9d1febc77fb28e537e4012b692b492d69428aca7deccf539e883cba4975497059ccdc56452f6e46f4a101b6e93f007667fe45c842e24')

prepare() {
  mv boto-{$_commit,$pkgver}
}

package() {
  cd boto-$pkgver

  python2 setup.py install -O1 --root="$pkgdir"
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
