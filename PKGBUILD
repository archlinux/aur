# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=shrinky
pkgver=1.0
pkgrel=1
pkgdesc='Build small executables with C++17 (based on dnload)'
arch=('any')
url='https://github.com/xyproto/shrinky/'
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'git')
source=("git+https://github.com/xyproto/shrinky#tag=v$pkgver")
md5sums=('SKIP')

package() {
  cd "$pkgname"
  python setup.py install --optimize=1 --root "$pkgdir"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 shrinky.sh "$pkgdir/usr/bin/$pkgname"
}

# vim: ts=2 sw=2 et:

