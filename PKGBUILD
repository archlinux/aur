# Maintainer: Franck STAUFFER <franck.stauffer@monaco.mc>

pkgname='volatility3'
pkgver=1.0.1
pkgrel=2
arch=('any')
license=('custom')
pkgdesc='An advanced memory forensics framework'
url='https://www.volatilityfoundation.org/'
depends=('python>=3.5.3' 'python-pefile>=2017.8.1')
optdepends=('python-yara>=3.8.0' 'python-capstone>=3.0.0')
source=("$pkgname-$pkgver.tar.gz::https://github.com/volatilityfoundation/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('09c68d329b25b8bd467156bf526e04a56e17a17d67e40ce4017e4307dbcbaa987dd78fe9dc5f3dc690d6e0c58542b728a96b58d73412e5776e653b2f38228739')

build() {
    ls
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
