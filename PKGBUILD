# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=wifi-heat-mapper
_name=whm
pkgver=0.2.4
pkgrel=1
pkgdesc="A Python library for benchmarking Wi-Fi networks to create heatmaps"
arch=('any')
url="https://github.com/nischay-pro/wifi-heat-mapper"
license=('GPL3')
depends=('python>=3.7' 'python-iperf3>=0.1.11' 'python-matplotlib>=3.4.0'
         'python-tqdm>=4.55.0' 'python-pillow>=8.2.0' 'python-scipy>=1.6.0'
         'python-numpy>=1.20.0' 'python-pysimplegui>=4.34.0')
makedepends=('python-setuptools')
optdepends=('speedtest-cli')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('cd60e202157b27ff5eb4127d80946f15f4573e1ccc4f0f9e49c7eaaf014cf0d6')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
