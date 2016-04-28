# Contributor: Roberto Nobrega <rwnobrega@gmail.com>
# Contributor: max.bra <max dot bra at alice dot it>

pkgname=gnome-gmail
pkgver=2.0.1
_pkgbranch=master
pkgrel=2
pkgdesc="It allows desktop mail actions, such as 'Send File as Email' or web 'mailto' links, to be handled by the Gmail web client."
arch=('any')
url="https://davesteele.github.io/gnome-gmail/index.html"
license=('GPL2')
depends=('python-gobject' 'python2-gnomekeyring' 'desktop-file-utils' 'python-setuptools' 'python-xdg' 'python-six' 'libwnck3')
optdepends=('nautilus-sendto: automatically upload an email with a file attachment from nautilus')
makedepends=('python-distutils-extra')
source=(https://github.com/davesteele/gnome-gmail/archive/master/$pkgver.tar.gz)
md5sums=('4ed177e9ef301b7919b56397bafae3f5')
install=$pkgname.install

build() {
  cd "$srcdir"/$pkgname-$_pkgbranch-$pkgver
  /usr/bin/python ./setup.py build
}

package() {
  cd "$srcdir"/$pkgname-$_pkgbranch-$pkgver
  /usr/bin/python ./setup.py install --root="$pkgdir"
}

