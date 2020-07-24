# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=sleep-inhibitor
pkgver=1.4
pkgrel=1
pkgdesc="Program to run plugins to inhibit system sleep/suspend"
url="https://github.com/bulletmark/$pkgname"
license=("GPL3")
arch=("any")
backup=("etc/$pkgname.conf")
depends=("python>=3.6" "python-ruamel-yaml")
makedepends=("python-setuptools")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha1sums=('1205884dd2fa53687fa3eab71fc08fda30f1a808')

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m 644 "$pkgname.service" \
    "$pkgdir/usr/lib/systemd/system/$pkgname.service"
}

# vim:set ts=2 sw=2 et:
