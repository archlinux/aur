# Contributor: Roberto Nobrega <rwnobrega@gmail.com>
# Contributor: max.bra <max dot bra at alice dot it>

pkgname=viagee
pkgver=3.7.2
_pkgbranch=master
pkgrel=1
pkgdesc="Formerly gnome-gmail. It allows desktop mail actions, such as 'Send File as Email' or web 'mailto' links, to be handled by the Gmail web client."
arch=('any')
url="https://davesteele.github.io/viagee/"
license=('GPL2')
depends=('python-gobject' 'python-keyring' 'desktop-file-utils' 'python-setuptools' 'python-xdg' 'xdg-utils' 'python-six' 'libwnck3')
optdepends=('nautilus-sendto: automatically upload an email with a file attachment from nautilus')
makedepends=('intltool')
conflicts=('gnome-gmail')
provides=('gnome-gmail')
replaces=('gnome-gmail')
source=(https://github.com/davesteele/$pkgname/archive/master/$pkgver.tar.gz)
md5sums=('95329a0ed929fd9bec4081c1fac4dc98')
install=$pkgname.install

build() {
  cd "$srcdir"/$pkgname-$_pkgbranch-$pkgver
  /usr/bin/python setup.py build
}

package() {
  cd "$srcdir"/$pkgname-$_pkgbranch-$pkgver
  /usr/bin/python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

