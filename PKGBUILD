# Maintainer: j605

_name="julia"
pkgname="python-${_name}"
pkgver=0.4.1
pkgrel=1
pkgdesc="python interface to julia"
arch=('any')
url="https://github.com/JuliaPy/pyjulia"
license=('MIT')
depends=('python')
makedepends=('python-pypandoc' 'pandoc')
source=("https://files.pythonhosted.org/packages/ed/13/c5511329618a3073c750132f41ec1b4dd37b1a1dd0df99aafca028d33a3d/$_name-$pkgver.tar.gz")
sha256sums=("3c3e6c5e593391627189b905b04363c9c35c08c2e9200711e4de510cdf711252")

build() {
  cd "${srcdir}/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "${srcdir}/$_name-$pkgver"
  python setup.py install --root="$pkgdir" --prefix=/usr -O1 --skip-build

  install -Dm 644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
