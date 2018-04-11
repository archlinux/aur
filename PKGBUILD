# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Samuel Littley <aur@toastwaffle.com>
# Contributor: rnons <remotenonsense at gmail dot com>

pkgname=python2-ruamel-yaml
pkgver=0.15.37
pkgrel=1
pkgdesc="YAML parser/emitter that supports roundtrip preservation of comments, seq/map flow style, and map key order"
arch=('i686' 'x86_64')
url="https://bitbucket.org/ruamel/yaml"
license=("MIT")
makedepends=('python2-pip' 'python2-wheel')
source=("https://pypi.io/packages/source/r/ruamel.yaml/ruamel.yaml-$pkgver.tar.gz")
sha512sums=('5a167a40664329df955da97cd0be3ea1b76225311fd40afdf721f86270b762455de75c44065b3bb28b8a6de46ce8de64cd6599bc807de3ce3ed362f982905adc')

package() {
  depends=('python2')

  cd ruamel.yaml-$pkgver
  LC_CTYPE=en_US.UTF-8 pip2 install . --root="$pkgdir"
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
