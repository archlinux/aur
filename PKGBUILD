# Maintainer: Franck STAUFFER <franck.stauffer@monaco.mc>

pkgname='volatility3'
pkgver=1.0.1
pkgrel=1
arch=('any')
license=('custom')
pkgdesc='An advanced memory forensics framework'
url='https://www.volatilityfoundation.org/'
depends=('python>=3.5.3' 'python-pefile>=2017.8.1')
optdepends=('python-yara>=3.8.0' 'python-capstone>=3.0.0')
source=("$pkgname-$pkgver.tar.gz::https://github.com/volatilityfoundation/$pkgname/archive/v1.0.0-beta.1.tar.gz")
b2sums=('67f55f6291dd56901db679bd52dacedf73b8f944991c44844766e9728f68796a1916fa43ed9802f18aa9aba7a9de83ceaa2ae9a53667c0bb39f2ac557419c478')

build() {
  cd "$pkgname-1.0.0-beta.1"
  python setup.py build
}

package() {
  cd "$pkgname-1.0.0-beta.1"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
