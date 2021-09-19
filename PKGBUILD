# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Samuel Littley <aur@toastwaffle.com>
# Contributor: rnons <remotenonsense at gmail dot com>

pkgname=python2-ruamel-yaml
pkgver=0.16.13
pkgrel=1
pkgdesc="YAML parser/emitter that supports roundtrip preservation of comments, seq/map flow style, and map key order"
arch=('any')
url="https://pypi.org/project/ruamel.yaml/"
license=("MIT")
makedepends=('python2-pip' 'python2-wheel')
source=("https://pypi.io/packages/source/r/ruamel.yaml/ruamel.yaml-$pkgver.tar.gz")
sha512sums=('5373f944c852be6d185555b61e2db51f4d0ceb2ad666cd4efa116eace116ad7132e80b41867396491019ded6523ec3de26800c1365f767bbf91c68dda0b56d3c')

package() {
  depends=('python2')

  cd ruamel.yaml-$pkgver
  LC_CTYPE=en_US.UTF-8 pip2 install . --root="$pkgdir"
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
