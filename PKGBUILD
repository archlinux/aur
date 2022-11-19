# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-railroad-diagrams
pkgver=2.0.4
_commit=f87f9483d96da76d784b489c34688832fb88cf84
pkgrel=1
pkgdesc="Generate SVG railroad syntax diagrams, like on JSON.org."
url="https://github.com/tabatkins/railroad-diagrams"
license=('MIT')
arch=('any')
depends=('python38')
makedepends=('python38-setuptools')
source=("https://github.com/tabatkins/railroad-diagrams/archive/$_commit/$pkgname-$_commit.tar.gz")
sha512sums=('48f3f8a4303d8101037a0089889ac901c112abdbfaf8a496deb3e733bee84dac437444874fe4ae454cc1e283dfacba2ff7e7f32deeb595ea3794573bc886fe99')

build() {
  cd railroad-diagrams-$_commit
  python3.8 setup.py build
}

check() {
  cd railroad-diagrams-$_commit
  python3.8 railroad.py
}

package() {
  cd railroad-diagrams-$_commit
  python3.8 setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
