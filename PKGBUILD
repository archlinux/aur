# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Slithery <aur at slithery dot uk>

pkgbase=python-linode_api4-git
pkgname=(python-linode_api4-git)
epoch=1
pkgver=5.3.0.r1.g1c65238
pkgrel=1
pkgdesc="Bindings for the Linode API v4"
arch=('any')
url="https://github.com/linode/linode_api4-python"
license=('BSD')
depends=('python-future')
makedepends=('python-setuptools')
provides=('python-linode_api4' 'python-linode-api')
conflicts=('python-linode_api4' 'python-linode-api')
source=("git+https://github.com/linode/linode_api4-python")
sha256sums=('SKIP')

pkgver() {
  cd linode_api4-python
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
  cd linode_api4-python
  python setup.py build
}

package() {
  cd linode_api4-python
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
