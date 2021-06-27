# Contributor: nblock <nblock [/at\] archlinux DOT us>
# Maintainer: nblock <nblock [/at\] archlinux DOT us>

pkgname=python-simplematch
_name=simplematch
pkgver=1.3
pkgrel=1
pkgdesc="Minimal, super readable string pattern matching for Python."
arch=('any')
url="https://github.com/tfeldmann/simplematch"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha1sums=('12e8abd792df3d361d5badce7db05b9884abd2a3')
sha256sums=('ed1d17d842799ee2222de1ea5f7fc3b4b1317464852214dc7dd197c1332a9f3c')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
