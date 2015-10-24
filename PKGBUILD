# Maintainer : Frederic Bezies <fredbezies at gmail dot com>
# Contributor: TDY <tdy@gmx.com>
# Contributor: shamrok <szamrok :: gmail.com>
# Contributor: Inigo Serna <inigoserna :: gmail.com>
# Contributor: aksr <aksr at t-com dot me>
pkgname=lfm
pkgver=3.0
pkgrel=1
pkgdesc="A powerful file manager for the UNIX console. Based on curses and written in Python."
arch=('any')
url="https://inigo.katxi.org/devel/lfm/"
license=('GPL3')
depends=('ncurses' 'python')
source=("https://inigo.katxi.org/devel/lfm/$pkgname-$pkgver.tar.gz")
md5sums=('6d063fe5cc0624b352c12e64e54b27ed')
sha1sums=('fe9f2c681f8c744d85e70ad958d833f8595c7772')
sha256sums=('01afadd56aded43887c40dec7c81394e5361ba390a3604bd510d69cafe36e3b8')


# In order to prevent curl warning.
DLAGENTS=("https::/usr/bin/curl -k -o %o %u")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir"
}

