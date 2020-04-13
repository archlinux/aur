# Maintainer: j605

_name="julia"
pkgname="python-${_name}"
pkgver=0.5.1
pkgrel=1
pkgdesc="python interface to julia"
arch=('any')
url="https://github.com/JuliaPy/pyjulia"
license=('MIT')
depends=('python')
makedepends=('python-pypandoc' 'pandoc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/JuliaPy/pyjulia/archive/v$pkgver.tar.gz")
sha256sums=('cab4bba53c035402a1294915eff4b8b8dc7dd69b0bd9d931c1c4ed9a9dcc1fb8')

build() {
  cd "pyjulia-$pkgver"
  python setup.py build
}

package() {
  cd "pyjulia-$pkgver"
  python setup.py install --root="$pkgdir" --prefix=/usr -O1 --skip-build

  install -Dm 644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
