# Contributor: billycongo <billycongo@gmail.com>
# Maintainer: dkaylor <dpkaylor@gmail.com>

pkgname=md5deep
pkgver=4.4
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Advanced checksum hashing tool"
url="https://github.com/jessek/hashdeep"
license=('Public Domain')

# Copyright and license stuff:
#
# This program is a work of the US Government.
# In accordance with 17 USC 105, copyright protection is not available for any work of the US Government. 
# This program is PUBLIC DOMAIN. Portions of this program contain code that is licensed under the terms of the General Public License (GPL). 
# Those portions retain their original copyright and license. See the file COPYING for more details.
# There is NO warranty for this program; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. 
#
# md5deep was originally developed by Jesse Kornblum <research (a t) jessekornblum ,,dot. com> during his service as a 
# Special Agent with the United States Air Force Office of Special Investigations (AFOSI).
# As such, md5deep exists in the public domain under 17 USC 105.

depends=('glibc')
source=("https://github.com/jessek/hashdeep/archive/release-$pkgver.tar.gz")
md5sums=('9ccfd5ba3e3d9cffddeb118cacad0c27')
sha1sums=('cb4e313352974299c32bc55fe56396adb74517ef')
sha256sums=('dbda8ab42a9c788d4566adcae980d022d8c3d52ee732f1cbfa126c551c8fcc46')
sha512sums=('c37ec85ed04d4452f9038f43434c02e064cf9e17c4eaa233867dba0236443922a14ccb8ec76c68820087751c2ca3db014d3f17dd8fcd2c2bde84d620aae50de1')


build() {
  cd "$srcdir/hashdeep-release-$pkgver"
  
  sh ./bootstrap.sh

  ./configure --prefix=/usr

  make
}

package() {
  cd "$srcdir/hashdeep-release-$pkgver"

  make DESTDIR=$pkgdir install
}
