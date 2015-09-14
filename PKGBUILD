# Maintainer: Konstantin Shalygin (k0ste@opentech.ru)

pkgname='yandex-tank'
pkgver='1.7.14'
pkgrel='0'
pkgdesc='Performance measurement tool'
arch=('any')
url='https://github.com/yandex/yandex-tank'
license=('GPL')
depends=('python2' 'python2-psutil' 'python2-ipaddr' 'python2-progressbar' 'phantom-engine-git')
source=("http://ppa.launchpad.net/yandex-load/main/ubuntu/pool/main/y/yandextank/yandextank_${pkgver}.tar.gz")
sha256sums=('48c4814663ead38843b7589cfc0bd3fed537b05609a36f009ba7ce1663b5c998')

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
