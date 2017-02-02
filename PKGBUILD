# Maintainer: Jan Max Meyer <codepilot@phorward.info>
pkgname=graveman
pkgver=0.3.12
_pkgverappendix="-5"
pkgrel=1
epoch=
pkgdesc="Graveman is a GPL frontend for: cdrecord, mkisofs, readcd, sox, flac, dvd+rw-format/dvd+rw-tools and cdrdao."
arch=('i686' 'x86_64')
url="https://graveman.tuxfamily.org"
license=('GPLv2')
depends=(
'glib2>=2.4.0'
'libglade>=2.4.0'
'libid3tag>=0.15'
'libmad>=0.15'
'libogg>=1.0.0'
'libvorbis>=1.0.0'
'cdrtools>=2.0.0'
'dvd+rw-tools>=5.20'
'sox>=12.17.0'
'flac>=1.1.0'
'cdrdao>=1.1.9'
'libmng>=1.0.0'
'perl-xml-parser'
)

source=("http://graveman.tuxfamily.org/sources/$pkgname-$pkgver$_pkgverappendix.tar.gz")
md5sums=('94183b71f345e405badcdf92ea04dfac')

build() {
	cd "$pkgname-$pkgver$_pkgverappendix"
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-$pkgver$_pkgverappendix"
	make -k check
}

package() {
	cd "$pkgname-$pkgver$_pkgverappendix"
	make DESTDIR="$pkgdir/" install
}

