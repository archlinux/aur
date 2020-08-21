# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname=xfce-hkmon
# work around until upstream versions
# https://github.com/lightful/xfce-hkmon/issues/7
_commit=6862a03e9ca7d2b0e96bece4cb88dfc9b3518987
_short=09
pkgver=0.$_short
pkgrel=1
pkgdesc="Hacker's monitor for XFCE"
arch=('x86_64')
url="https://lightful.github.io/xfce-hkmon"
license=(GPL)
depends=(xfce4-genmon-plugin)
source=("$pkgname-$pkgver".tar.gz::"https://github.com/lightful/$pkgname/archive/$_commit.tar.gz")
b2sums=('ae6184e1ff2e85cd8a71d5854f355f534ed7fec48a673ae45fadff3a86ff72b14ac7f0e94f0f0c8d93dd71df81c86e531b8230e9ac4cd1c9af10b6c36a873949')
install=readme.install

build() {
  cd "$pkgname-$_commit"
  g++ -std=c++0x -O3 -lrt xfce-hkmon.cpp -o xfce-hkmon

}

package() {
  install -p -d "$pkgdir"/usr/bin
  install -p -m755 "$pkgname-$_commit/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

