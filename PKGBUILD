# Maintainer: robertfoster
# Contributor: Tobias Luther <tobias [at] tonstrom [dot] de> 
# Contributor: GraveDigger 
# Contributor: Gaetan Bisson <bisson@archlinux.org>

pkgname=idjc
pkgver=0.8.17
pkgrel=1
pkgdesc='Powerful client for individuals interested in streaming live radio shows'
url='http://idjc.sourceforge.net/'
license=('GPL2')
arch=('i686' 'x86_64')
depends=('dbus-python'
	'desktop-file-utils'
	'ffmpeg'
	'flac'
	'glib2'
	'jack'
	'lame'
	'libmad'
	'libsamplerate'
	'libshout-idjc'
	'libsndfile'
	'mutagen'
	'pygtk'
	'python2'
	'speex'
	'twolame'
	'vorbis-tools'
)

optdepends=('mysql-python: Ampache and Prokyon 3 support')
conflicts=('idjc-git')
install=${pkgname}.install
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz")

build() {
   cd "${srcdir}/${pkgname}-${pkgver}"

   export PYTHON=/usr/bin/python2
    ./configure \
        --prefix=/usr \
        --libexecdir=/usr/lib \
        --disable-static
   make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}

md5sums=('47f13035d94f5c378bf237c335194a4d')
