# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: Neil Santos <nsantos16+aur@gmail.com>

pkgname=bzrlog
_pkgname=BzrLog
pkgver=1.1
pkgrel=3
pkgdesc='Log oriented GUI for Bazaar VCS'
arch=('any')
url='https://launchpad.net/bzrlog'
license=('GPL2')
depends=('bzr' 'pygtk' 'bzr-gtk-gtk2')
source=("https://launchpad.net/$pkgname/trunk/$pkgver/+download/$_pkgname-${pkgver}.tar.gz" bzr-gtk-gtk2.patch)
md5sums=('26b655e4edcabd2ccfa71c66dafac89b'
         '2656e6f33c808d48f3002f0ceb35e02f')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"
  patch -p0 < ../bzr-gtk-gtk2.patch
  sed -i '1s|#!/usr/bin/env python|#!/usr/bin/python2|' bzrlog
}

package() {
  mkdir -p $pkgdir/usr/bin
  install -m 755 $srcdir/$_pkgname-$pkgver/bzrlog  $pkgdir/usr/bin/bzrlog
}

# vim:set ts=2 sw=2 et:
