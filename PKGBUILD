# Maintainer: graysky <graysky AT archlinux DOT us>
pkgname=psrecord
pkgver=1.1
pkgrel=1
pkgdesc="Record the CPU and memory activity of a process"
arch=('x86_64')
url="https://github.com/astrofrog/psrecord"
license=('BSD')
depends=('python-psutil' 'python')
makedepends=('python' 'python-pytest')
optdepends=('python-matplotlib: to generate plots')
source=("$pkgname-$pkgver.tar.gz::https://github.com/astrofrog/psrecord/archive/v1.1.tar.gz")
sha256sums=('334ff9d1ef4d8ab7c770b840ccb90b9b0e5c0fd4f8d2679e9cf579cdb8846f6b')

build() {
	cd "$pkgname-$pkgver"
  python setup.py build
}

check() {
  cd "$pkgname-$pkgver"
  pytest psrecord
}

package() {
	cd "$pkgname-$pkgver"
  python setup.py install --root=${pkgdir} --optimize=1
}
