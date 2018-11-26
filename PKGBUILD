# Maintainer: j605

_name="julia"
pkgname="python-${_name}"
pkgver=0.2.0
pkgrel=1
pkgdesc="python interface to julia"
arch=('any')
url="https://github.com/JuliaPy/pyjulia"
license=('MIT')
depends=('python')
makedepends=('python-pypandoc' 'pandoc')
source=("https://files.pythonhosted.org/packages/35/d2/98ccbb45f2511c1b7d16ad2c83bf7858e1b53b46a37ff052bfa09d0dce81/$_name-$pkgver.tar.gz")
sha256sums=("a4443c2927b2edc92da580052077c6b307256827e56d8df50679c6f6935b0b9e")

build() {
  cd "${srcdir}/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "${srcdir}/$_name-$pkgver"
  python setup.py install --root="$pkgdir" --prefix=/usr -O1 --skip-build

  install -Dm 644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
