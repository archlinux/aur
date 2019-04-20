# Maintainer: j605

_name="julia"
pkgname="python-${_name}"
pkgver=0.4.0
pkgrel=1
pkgdesc="python interface to julia"
arch=('any')
url="https://github.com/JuliaPy/pyjulia"
license=('MIT')
depends=('python')
makedepends=('python-pypandoc' 'pandoc')
source=("https://files.pythonhosted.org/packages/bc/a9/2395806544d00050f4d6da4c53649563fd914054df6c2f59734067318f08/$_name-$pkgver.tar.gz")
sha256sums=("937c7f7908faa16a695b79f347571bdbd16c3aa79f224e8dbbc6a6e67d3a26ad")

build() {
  cd "${srcdir}/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "${srcdir}/$_name-$pkgver"
  python setup.py install --root="$pkgdir" --prefix=/usr -O1 --skip-build

  install -Dm 644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
