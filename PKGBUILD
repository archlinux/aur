# Maintainer: Michael Seiwald <michael@mseiwald.at>
pkgname=nfs4-acl-tools
pkgver=0.3.3
pkgrel=1
pkgdesc="commandline ACL utilities for the Linux NFSv4 client"
arch=('i686' 'x86_64')
url="http://www.citi.umich.edu/projects/nfsv4/linux/nfs4-acl-tools/"
license=('custom')
groups=()
depends=('attr')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://www.citi.umich.edu/projects/nfsv4/linux/nfs4-acl-tools/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('ece4d5599c3b8470990ee1adbe22e047')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
  install -Dm644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}

# vim:set ts=2 sw=2 et:
