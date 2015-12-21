# Maintainer: Konstantin Shalygin (k0ste@opentech.ru)

pkgname='yandex-tank'
pkgver='1.7.26'
pkgrel='0'
pkgdesc='Performance measurement tool'
arch=('any')
url='https://github.com/yandex/yandex-tank'
license=('GPL')
depends=('python2' 'python2-psutil' 'python2-ipaddr' 'python2-progressbar' 'phantom-engine-git')
source=("http://ppa.launchpad.net/yandex-load/main/ubuntu/pool/main/y/yandextank/yandextank_${pkgver}.tar.gz")
sha256sums=('028bc96288c81b6d74cb9c827f4ab2bd0410fcdbaaed959d59678f3171b75c4b')

build() {
  cd "$srcdir/$pkgname"
  python2 setup.py build
}

package() {
  pushd "$srcdir/$pkgname"
  python2 setup.py install --root="$pkgdir"
  install -Dm644 "COPYING" "$pkgdir/usr/share/doc/$pkgname/COPYING"
  popd
}
