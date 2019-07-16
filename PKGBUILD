# Maintainer: Theo Ouzhinski <touzhinski at gmail dot com>

pkgname=python-mazer
pkgver=1.0.0
pkgrel=2
pkgdesc='An experimental Ansible content manager'
arch=('any')
url=https://github.com/ansible/mazer
license=('GPL3')
depends=('python' 'python-pyaml' 'python-jinja' 'python-semantic-version' 'python-attrs' 'python-requests' 'python-yamlloader')
source=("https://files.pythonhosted.org/packages/source/m/mazer/mazer-$pkgver.tar.gz")
sha512sums=("7163948aeba67f8a5a8a82fae7b627f3f52e6db354df028b6700ae498851b4d03c3ebad4d41e4978cac11dd4ed058e91c380bd9cbb21fa1d22fa47148ea1cfee")

build() {
  cd "mazer-$pkgver"
  python setup.py build
}

package() {
  cd "mazer-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
