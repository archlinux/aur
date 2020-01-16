# Maintainer: Stephan Springer <buzo+arch@Lini.de>

pkgname=check-cve-2019-19781
pkgver=1.0.2
pkgrel=1
pkgdesc='Citrix CVE-2019-19781 (#Shitrix) vulnerability/mitigation checker'
url='https://github.com/cisagov/check-cve-2019-19781'
arch=('any')
license=('Unlicense')
depends=('python' 'python-docopt' 'python-schema')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/cisagov/check-cve-2019-19781/archive/v$pkgver.tar.gz")
sha256sums=('fa2e4633b0ea7c4f758a2bc123c586721d24adbcd392d199a5a731d2196b3029')

build() {
  cd "$pkgname-$pkgver"
  python3 setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  python3 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
