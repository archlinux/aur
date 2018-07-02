# Maintainer: j605

_name="julia"
pkgname="python-${_name}"
pkgver=0.1.5
pkgrel=1
pkgdesc="python interface to julia"
arch=('any')
url="https://github.com/JuliaPy/pyjulia"
license=('MIT')
depends=('python')
makedepends=('python-pypandoc' 'pandoc')
source=("https://files.pythonhosted.org/packages/cf/d3/81e970293b11415cebe3d4a1930311980249861d5d5f545fdfdbe86a71ae/$_name-$pkgver.tar.gz")
sha256sums=("6f38e17f831580723a5e01bb751518b6eb9d0789dc7b5e6e12a8cc1701a2c0f0")

build() {
  cd "${srcdir}/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "${srcdir}/$_name-$pkgver"
  python setup.py install --root="$pkgdir" --prefix=/usr -O1 --skip-build

  install -Dm 644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
