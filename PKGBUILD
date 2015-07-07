# Contributor: Angelo Theodorou <encelo@users.sourceforge.net>

pkgname=pgworksheet
pkgver=1.9
pkgrel=1
pkgdesc="A simple GUI frontend to PostgreSQL"
arch=('i686')
url="http://pgworksheet.projects.postgresql.org/"
license=('GPL')
depends=('pygtk' 'pypgsql')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.bz2)
md5sums=('f70c8884350ad8a8e266697d23e4cdeb')

build() {
  cd $startdir/src/$pkgname-$pkgver
  python setup.py install --root=$startdir/pkg --prefix=/usr

  # Correct some permissions
  chmod a+r $startdir/pkg/usr/share/pixmaps/pgworksheet.png
  chmod a+r $startdir/pkg/usr/share/pixmaps/pgworksheet/*
  chmod a+r $startdir/pkg/usr/share/applications/pgworksheet.desktop
}
