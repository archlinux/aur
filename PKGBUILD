# Maintainer: Simon Kohlmeyer <simon.kohlmeyer@gmail.com>
# Contributor: nblock <nblock [/at\] archlinux DOT us>

_modulename=tasklib
pkgname=python-$_modulename
pkgver=1.3.0
pkgrel=1
pkgdesc="Python library for interacting with taskwarrior databases."
arch=('any')
url="https://github.com/robgolding/tasklib"
license=('BSD')
depends=('python' 'python-six' 'python-pytz' 'python-tzlocal')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("$pkgname-$pkgver.tar.gz::https://github.com/robgolding/$_modulename/archive/$pkgver.tar.gz")
sha256sums=('ac5137466f0a3e2940a1c973f9765afec4ec02cd1d42ac81e226dca95de35670')

build() {
  cd "$_modulename-$pkgver"
  python setup.py build
}

package() {
  cd "$_modulename-$pkgver"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
