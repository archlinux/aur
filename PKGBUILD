# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
# Based on python-ruamel-yaml, pkgver 0.15.52
pkgname=python-ruamel-yaml0.15.52
pkgver=0.15.52
pkgrel=1
pkgdesc="YAML parser/emitter that supports roundtrip preservation of comments, seq/map flow style, and map key order"
arch=('x86_64')
url="https://bitbucket.org/ruamel/yaml"
license=("MIT")
makedepends=('python-pip' 'python-wheel')
provides=("python-ruamel-yaml=$pkgver")
conflicts=('python-ruamel-yaml')
source=("https://pypi.io/packages/source/r/ruamel.yaml/ruamel.yaml-$pkgver.tar.gz")
sha512sums=('800a2e9e84b5272d0c030c4864972901b54d324cee93b62c5b762b861903909c8593ae523826f82bb8e79c853afbc7e435ba5b0472bd35d9b8e63f124c6ab2e1')

package() {
  depends=('python')

  cd ruamel.yaml-$pkgver
  LC_CTYPE=en_US.UTF-8 pip install . --root="$pkgdir"
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
