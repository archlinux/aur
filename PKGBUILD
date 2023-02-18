# Maintainer: Andrej Radović <r.andrej@gmail.com>
pkgname=python-jinja2-ansible-filters
_name=${pkgname#python-}
pkgver=1.3.2
pkgrel=1
pkgdesc="A port of the ansible filters provided by Ansible's templating engine"
url="https://gitlab.com/dreamer-labs/libraries/jinja2-ansible-filters"
depends=('python')
makedepends=('python-setuptools')
optdepends=(
    'python-jinja'
    'python-yaml'
    'python-pytest'
    'python-pytest-cov'
)
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('07c10cf44d7073f4f01102ca12d9a2dc31b41d47e4c61ed92ef6a6d2669b356b')

build() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
