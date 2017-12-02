# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Samuel Littley <aur@toastwaffle.com>
# Contributor: rnons <remotenonsense at gmail dot com>

pkgname=python2-ruamel-yaml
pkgver=0.15.34
pkgrel=1
pkgdesc="YAML parser/emitter that supports roundtrip preservation of comments, seq/map flow style, and map key order"
arch=('i686' 'x86_64')
url="https://bitbucket.org/ruamel/yaml"
license=("MIT")
makedepends=('python2-pip' 'python2-wheel')
source=("https://pypi.io/packages/source/r/ruamel.yaml/ruamel.yaml-$pkgver.tar.gz")
sha512sums=('f5ae2c590f5570b40d4c05ee86eaf326d210897f6d27fecefd1a43de2dcb7189d181572cf24df370d78568622822df193e4126c1d42ae4a528eba8f281272545')

package() {
  depends=('python2')

  cd ruamel.yaml-$pkgver
  LC_CTYPE=en_US.UTF-8 pip2 install . --root="$pkgdir"
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
