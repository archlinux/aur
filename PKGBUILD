# Maintainer: Clayton Craft <clayton at craftyguy dot net>

pkgname=python-grip
pkgver=4.5.2
pkgrel=1
pkgdesc="Preview GitHub Markdown files like Readme locally before committing them"
arch=('any')
license=('MIT')
url="https://github.com/joeyespo/grip"
depends=('python' 'python-docopt' 'python-flask' 'python-markdown'
         'python-path-and-address' 'python-pygments' 'python-requests')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/joeyespo/grip/archive/v$pkgver.tar.gz")
sha256sums=('bdf8949f33470e9ef9e3f09596b72cda968116ff32f0280baabe837c2ad1b29b')

package() {
  cd grip-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
