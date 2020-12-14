# Maintainer: pumpkincheshire <sollyonzou@gmail.com>

pkgname=python-viztracer
_name=viztracer
pkgver=0.10.5
pkgrel=1
pkgdesc='VizTracer is a low-overhead logging/debugging/profiling tool that can trace and visualize your python code execution.'
arch=('x86_64')
url='https://github.com/gaogaotiantian/viztracer'
license=('Apache')
depends=('python')
makedepends=('python-setuptools')
optdepends=('python-rich: Full function support'
  'python-orjson: Full function support'
  'chromium: browser to open html results')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('258c8775cb65620056141069f7c0c8ac8df33ab843f076d817611555e0b97fc2')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  #  install -Dm644 $scrdir/README* "${pkgdir}/usr/share/doc/${pkgname}/README"
}
