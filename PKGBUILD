# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>
# Contributor: Muflone http://www.muflone.com/contacts/english/
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

_name=docopt
pkgname=python2-$_name
pkgver=0.6.2
pkgrel=5
pkgdesc='Pythonic argument parser, that will make you smile'
arch=('any')
url="https://github.com/docopt/$_name"
license=('MIT')
depends=('python2')
makedepends=('python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('49b3a825280bd66b3aa83585ef59c4a8c82f2c8a522dbe754a8bc8d08c85c491')

build() {
  cd "$_name-$pkgver"

  python2 setup.py build
}

package() {
  cd "$_name-$pkgver"

  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
