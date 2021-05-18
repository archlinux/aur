# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=wifi-heat-mapper
_name=whm
pkgver=0.2.2
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
sha256sums=('fbf752a5b37695618126715d67b0c4228c137d10a17eb40594894bd0c67532da')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
