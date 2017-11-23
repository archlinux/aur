# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=rstcheck
pkgver=3.1
pkgrel=1
pkgdesc='Checks syntax of reStructuredText and code blocks nested within it'
arch=('any')
url=https://github.com/myint/rstcheck
license=('MIT')
depends=('python-docutils')
optdepends=('python-sphinx: Sphinx support')
source=("rstcheck-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('40a47536ba380e3ce0ec44bb3406f966dce11f762f7eaa57e52b642a9db63737778deee32361390eccbe8f4cd4b23f584fb2629c1806f118a5260ae05b0c2296')

build() {
  cd rstcheck-$pkgver
  python setup.py build
}

check() {
  cd rstcheck-$pkgver
  python test_rstcheck.py
}

package() {
  cd rstcheck-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/rstcheck/LICENSE
}

# vim:set ts=2 sw=2 et:
