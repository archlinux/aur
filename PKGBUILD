# Maintainer: Alois Nespor <info@aloisnespor.info>
# Contributor: aleksonik imsnet@yandex.ru

pkgname=hzs_reminder
pkgver=2016.06.11
pkgrel=1
pkgdesc="Birthday Reminder"
arch=('i686' 'x86_64')
url="https://sourceforge.net/p/hzsreminder/wiki/Home/"
license=('GPL')
depends=('qt5-base')
source=("https://bitbucket.org/alium/hzs_reminder/downloads/hzs_reminder_source.tar.gz")


build() {
msg "Starting build..."
cd "$srcdir"/hzs_reminder_source
qmake-qt5  QMAKE_CFLAGS_RELEASE="$CPPFLAGS $CFLAGS" QMAKE_CXXFLAGS_RELEASE="$CPPFLAGS $CXXFLAGS" QMAKE_LFLAGS_RELEASE="$LDFLAGS"
make
}


package() {
install -D -m755 $srcdir/hzs_reminder_source/reminder $pkgdir/usr/bin/reminder
}

sha256sums=('c6b5ed38f62b0287b774040251c397f2e46586a28710ede80f2a91b736332481')
