# Maintainer: Patrice Peterson <runiq at archlinux dot us>

pkgname=mswatch
pkgver=1.2.0
pkgrel=2
pkgdesc="A utility to watch mailstores for changes and initiate mailbox syncs"
arch=('x86_64')
url="http://mswatch.sourceforge.net/"
license=('GPL')
depends=('glib2')
source=(http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('2623514442237e11c91a06ab406d9594669ddb70fd1d55b84371ea613e8ac1a7')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --with-notify=inotify
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install

  install -D -m644 AUTHORS "${pkgdir}/usr/share/doc/${pkgname}/AUTHORS"
  install -D -m644 ChangeLog "${pkgdir}/usr/share/doc/${pkgname}/ChangeLog"
  install -D -m644 INSTALL "${pkgdir}/usr/share/doc/${pkgname}/INSTALL"
  install -D -m644 INTERFACES "${pkgdir}/usr/share/doc/${pkgname}/INTERFACES"
  install -D -m644 NEWS "${pkgdir}/usr/share/doc/${pkgname}/NEWS"
  install -D -m644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -D -m644 TODO "${pkgdir}/usr/share/doc/${pkgname}/TODO"
  install -D -m644 VERSION "${pkgdir}/usr/share/doc/${pkgname}/VERSION"
  install -D -m644 generalized "${pkgdir}/usr/share/doc/${pkgname}/generalized"
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

# vim:set ts=2 sw=2 et:
