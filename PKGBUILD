# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>

_pkgname=python-wikeddiff
pkgname=python-wikeddiff-git
pkgver=1.2.4.r10.g035db40
pkgrel=4
pkgdesc="Visual inline-style difference engine with block move support"
arch=(any)
url="https://github.com/lahwaacz/python-wikeddiff"
license=(GPL-3.0-or-later)
depends=(python)
makedepends=(git python-setuptools)
source=('git+https://github.com/lahwaacz/python-wikeddiff')
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --tags --always | sed 's|^v||;s|\([^-]*-g\)|r\1|;s|-|.|g'
}

build() {
  cd "$_pkgname"
  python setup.py build
}

package() {
  cd "$_pkgname"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
