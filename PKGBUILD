# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

_name=fake-useragent
pkgname=python-fake-useragent
pkgver=0.1.11
pkgrel=1
pkgdesc='Up to date simple useragent faker with real world database'
arch=('any')
url=https://github.com/hellysmile/fake-useragent
license=('Apache')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('38dd46a1186a92b87d8886876dd0163640d39a852c00d7264947f940a59331168d595c4ee9fce357a2fed07425a557d80ad6c5a693ec0087ea2b69e327927ed1')

build() {
  cd $_name-$pkgver
  python setup.py build
}

package() {
  cd $_name-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
