# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>
# -*- mode: sh -*-

pkgname=python-ansi
_pkgname=ansi
pkgver=0.2.0
pkgrel=3
pkgdesc='ANSI cursor movement and graphics'
arch=('any')
url='https://github.com/tehmaze/ansi'
license=('MIT')
depends=('python')
options=(!emptydirs)
source=("https://github.com/tehmaze/$_pkgname/archive/$_pkgname-$pkgver.tar.gz")
md5sums=(
  '4ca39529c69d1f663a0785a1602308e9'
)
sha1sums=(
  '1197085f91c4f95adf78aa02f6d03f947a19a8a9'
)
sha256sums=(
  'bda257548e15d26c8a35edd00faf304c360bf1e1046ce416a9968278e356afbe'
)
sha512sums=(
  '22c69b5030f03eca9470e288c16e62042ccd02ef2e232600a4fab629354601d5da0f7c16b60dae7293c69255e5d4125298890d99dba8e5387960a5be60b92d61'
)
b2sums=(
  '436caa8e1f36e96f1844e79e3a0ff0c4099e76b25ce9f56c9d8663aeeb650f32fba75a14fe8548f557fb020e2340707272fdda4cdd3c245c903a4f801ae48413'
)

build() {
  cd "$srcdir/$_pkgname-$_pkgname-$pkgver" || exit 1

  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$_pkgname-$pkgver" || exit 1

  python setup.py install --root="$pkgdir/" --optimize=1

  install -Dm0644 README.md  "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm0644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# eof
