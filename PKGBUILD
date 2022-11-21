# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=python38-oslo-i18n
pkgver=5.1.0
pkgrel=3
pkgdesc="Oslo i18n library"
arch=('any')
url="https://pypi.python.org/pypi/oslo.i18n/$pkgver"
license=('Apache')
depends=('python38-pbr')
checkdepends=('python38-oslotest' 'python38-oslo-config')
source=("https://github.com/openstack/oslo.i18n/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('d9cca3af4f899517fa7d2ea961b6c6c03080e0e3343acc2abcc06698ad6ff10fc95189ff312255fd1285e174104c6667ecd2e1abc5b1b5168705bdabf58306e0')

export PBR_VERSION=$pkgver

build() {
  cd oslo.i18n-$pkgver
  python3.8 setup.py build
}

check() {
  cd oslo.i18n-$pkgver
  stestr run
}

package() {
  cd oslo.i18n-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
