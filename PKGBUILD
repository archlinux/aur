# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>

_name=sphinxcontrib-serializinghtml
pkgname=python2-$_name
pkgver=1.1.5
pkgrel=1
pkgdesc='Sphinx extension which outputs "serialized" HTML files (json and pickle)'
arch=('any')
url=https://github.com/sphinx-doc/sphinxcontrib-serializinghtml
license=('BSD')
makedepends=('python2-setuptools')
checkdepends=('python2-pytest' 'python2-sphinx')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('aa5f6de5dfdf809ef505c4895e51ef5c9eac17d0f287933eb49ec495280b6952')
b2sums=('e2da8b1e1300a327b8d508ce98e7c0d3eff1e0cea28cd874df4fbd9ed0bd4de6c17e107e622ec72e00bb237025ae26b2c5aaa33b2156cee2fad7c8f8d2c65ed5')

build() {
  cd $_name-$pkgver
  python2 setup.py build
}

# check() {
#   cd $_name-$pkgver
#   pytest2
# }

package() {
  cd $_name-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}

# vim:set ts=2 sw=2 et:
