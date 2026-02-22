pkgname=rednotebook-pwd-mod
pkgver=1.0.0
pkgrel=1
pkgdesc="A modern desktop diary and personal journal with true AES-256-GCM encryption."
arch=('any')
url="https://github.com/ProgrammerGnome/rednotebook-pwd-mod"
license=('GPL')
depends=('python' 'python-gobject' 'python-yaml' 'gtk3' 'python-cryptography')
makedepends=('python-setuptools')
conflicts=('rednotebook')
provides=('rednotebook')
replaces=('rednotebook')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ProgrammerGnome/rednotebook-pwd-mod/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP') # Később ide be kell tenni a valós hash-t!

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}

