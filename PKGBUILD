# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=wifi-heat-mapper
_name=whm
pkgver=0.2.3
pkgrel=1
pkgdesc="A Python library for benchmarking Wi-Fi networks to create heatmaps"
arch=('x86_64')
url="https://github.com/nischay-pro/wifi-heat-mapper"
license=('GPL3')
depends=('python' 'python-iperf3' 'python-matplotlib' 'python-tqdm'
         'python-pillow' 'python-scipy' 'python-numpy' 'python-pysimplegui')
makedepends=('python-setuptools')
optdepends=('speedtest-cli')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('b6c368a7be1732bbdb860ff522b63fc5a4eb4b85b5b4879780dd874b53265952')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
