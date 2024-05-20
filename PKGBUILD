# Maintainer liganic <aur@replace-this-with-my-username.com>
# Contributor: Radek Podgorny <radek@podgorny.cz>

pkgname=python-spidev
_name=spidev
pkgver=3.6
pkgrel=1
pkgdesc="Python bindings for Linux SPI access through spidev"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/doceme/py-spidev"
license=('GPL')
depends=('python')
makedepends=('python-setuptools' 'git')
source=("python-spidev::git+https://github.com/doceme/py-spidev.git#tag=v$pkgver")
sha256sums=('86624a249dbc97c67f6d1a2b321b3d737ee1043452a623adf3b2f29665412de6')

build() {
  cd "$srcdir/$pkgname"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1
}