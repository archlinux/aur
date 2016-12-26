
# Maintainer: M0Rf30

pkgname=idjc-x-git
pkgver=935.280ab4e
pkgrel=1
pkgdesc="Powerful client for individuals interested in streaming live radio shows"
arch=(i686 x86_64)
url="http://idjc.sourceforge.net/"
depends=('python-dbus'
	 'desktop-file-utils'
	 'ffmpeg'
	 'flac'
	 'glib2'
	 'jack'
	 'lame'
	 'libmad'
	 'libsamplerate'
	 'libshout-idjc-git'
	 'libsndfile'
	 'python-mutagen'
	 'python-gobject'
	 'python'
	 'speex'
	 'twolame'
	 'vorbis-tools'
)
makedepends=('git')
replaces=('idjc' 'idjc-git')
conflicts=('idjc' 'idjc-git')
license=('GPL3')
source=('idjc-x::git+https://github.com/radiocicletta/idjc-x.git')


build()
{
  cd idjc-x
  ./bootstrap
    ./configure \
        --prefix=/usr \
        --libexecdir=/usr/lib \
        --disable-static
  make
}

package()
{               
  cd idjc-x
  make DESTDIR=$pkgdir install
}

pkgver() {
  cd idjc-x
  echo $(git rev-list --count github).$(git rev-parse --short github)
}

md5sums=('SKIP')

