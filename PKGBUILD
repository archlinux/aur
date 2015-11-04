# Maintainer: Konstantin Shalygin (k0ste@opentech.ru)

pkgname='yandex-tank'
pkgver='1.7.18'
pkgrel='0'
pkgdesc='Performance measurement tool'
arch=('any')
url='https://github.com/yandex/yandex-tank'
license=('GPL')
depends=('python2' 'python2-psutil' 'python2-ipaddr' 'python2-progressbar' 'phantom-engine-git')
source=("http://ppa.launchpad.net/yandex-load/main/ubuntu/pool/main/y/yandextank/yandextank_${pkgver}.tar.gz")
sha256sums=('27fad648eaf0c49a149c245a589e1c2b62a18865e997721a00e5df8e1df4d772')

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
