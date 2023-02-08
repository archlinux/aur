# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=ognibuild
pkgver=0.0.18
pkgrel=2
pkgdesc="Detect and invoke build systems"
arch=('any')
#url="https://jelmer.uk/code/ognibuild"
url="https://github.com/jelmer/ognibuild"
license=('GPL2')
depends=('breezy' 'python-buildlog-consultant' 'python-requirements-parser'
         'python-ruamel-yaml' 'python-setuptools' 'python-toml')
makedepends=('python-build' 'python-installer' 'python-wheel')
optdepends=('python-apt' 'python-debmutate')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('8d16daa719503a1c1026ea3793c1b8c5f7ebd3dd9476d0223f828e736d521edf')
#validpgpkeys=('DC837EE14A7E37347E87061700806F2BD729A457') # Jelmer Vernooĳ <jelmer@jelmer.uk> (expired)

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
