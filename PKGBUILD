# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
# Based on python-ruamel-yaml, pkgver 0.15.51
pkgname=python-ruamel-yaml0.15.51
pkgver=0.15.51
pkgrel=1
pkgdesc="YAML parser/emitter that supports roundtrip preservation of comments, seq/map flow style, and map key order"
arch=('x86_64')
url="https://bitbucket.org/ruamel/yaml"
license=("MIT")
makedepends=('python-pip' 'python-wheel')
provides=("python-ruamel-yaml=$pkgver")
conflicts=('python-ruamel-yaml')
source=("https://pypi.io/packages/source/r/ruamel.yaml/ruamel.yaml-$pkgver.tar.gz")
sha512sums=('250249195b4c186fd677369e69ed4c6c4e48f4aa7544dff80a6ee687ed4c2e37a90d85e5ce6bbafccf15f1384ccbd11dd7d3764327ecbc91ab9be7ec707696e7')

package() {
  depends=('python')

  cd ruamel.yaml-$pkgver
  LC_CTYPE=en_US.UTF-8 pip install . --root="$pkgdir"
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
