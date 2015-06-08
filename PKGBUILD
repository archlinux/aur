# Contributor: Roberto Nobrega <rwnobrega@gmail.com>
# Contributor: max.bra <max dot bra at alice dot it>

pkgname=gnome-gmail
pkgver=1.9.1.1
_pkgbranch=master
pkgrel=1
pkgdesc="It allows desktop mail actions, such as 'Send File as Email' or web 'mailto' links, to be handled by the Gmail web client."
arch=('any')
url="https://davesteele.github.io/gnome-gmail/index.html"
license=('GPL2')
depends=('python2-gobject' 'python2-gnomekeyring' 'desktop-file-utils' 'python2-setuptools' 'python2-xdg' 'gtk3>=3.10')
optdepends=('nautilus-sendto: automatically upload an email with a file attachment from nautilus')
makedepends=('python2-distutils-extra')
source=('https://github.com/max72bra/gnome-gmail/archive/master/1.9.1.1.tar.gz')
md5sums=('2954d7f5a13f396c459054b6246193df')
install=$pkgname.install

build() {
  cd "$srcdir"/$pkgname-$_pkgbranch-$pkgver
  python2 ./setup.py build
}

package() {
  cd "$srcdir"/$pkgname-$_pkgbranch-$pkgver
  python2 ./setup.py install --root="$pkgdir"
}

