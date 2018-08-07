# Maintainer: Jakub Klinkovský <j.l.k@gmx.com>

_pkgname=python-wikeddiff
pkgname=python-wikeddiff-git
pkgdesc="Visual inline-style difference engine with block move support"
pkgver=1.2.4.r6.gc164da5
pkgrel=1
arch=('any')
url="https://github.com/lahwaacz/python-wikeddiff"
license=('GPLv3')
depends=('python')
makedepends=('git')
source=('git://github.com/lahwaacz/python-wikeddiff')
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

# vim:set ts=2 sw=2 et:
