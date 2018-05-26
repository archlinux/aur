# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

_name=fake-useragent
pkgname=python-fake-useragent
pkgver=0.1.10
pkgrel=1
pkgdesc='Up to date simple useragent faker with real world database'
arch=('any')
url=https://github.com/hellysmile/fake-useragent
license=('Apache')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('b8365a76b048c012effa9f96cc077260f046970e81c9df1d672cd919bb1113adba5bcee8f17706fb41d9593906b95e25bf9dde1e509d53618ecc342671b6bf8f')

build() {
  cd $_name-$pkgver
  python setup.py build
}

package() {
  cd $_name-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
