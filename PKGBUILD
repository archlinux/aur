# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-hpack
pkgver=4.0.0
pkgrel=3
pkgdesc="Pure-Python HPACK header compression"
arch=('any')
url="https://hyper.rtfd.org/"
license=('MIT')
depends=('python38')
makedepends=('python38-setuptools')
checkdepends=('python38-pytest-runner' 'python38-hypothesis')
source=("https://github.com/python-hyper/hpack/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('f482d086d7a82649393e3cfea55c98966ce57055cb1826bc4dec1ea334661c02708e7903f2e8e588ee1c30df41373e1de9fb960c2e7bbc18d0ace0b8f97b195b')

build() {
  cd hpack-$pkgver
  python3.8 setup.py build
}

check() {
  cd hpack-$pkgver
  python3.8 setup.py pytest
}

package() {
  cd hpack-$pkgver
  python3.8 setup.py install -O1 --root "$pkgdir"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
