# Maintainer: nblock <nblock [/at\] archlinux DOT us>
# Contributor: Simon Kohlmeyer <simon.kohlmeyer@gmail.com>

pkgname=python-tasklib
_name=${pkgname#python-}
pkgver=2.2.1
pkgrel=1
pkgdesc="Python library for interacting with taskwarrior databases."
arch=('any')
url="https://github.com/robgolding/tasklib"
license=('BSD')
depends=('python' 'python-pytz' 'python-tzlocal')
makedepends=('python-setuptools')
options=(!emptydirs)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('21525a34469928876b64edf8abf79cf788bb3fa796d4554ba22a68bc1f0693f5')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
