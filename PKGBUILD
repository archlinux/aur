# Maintainer: rws <elisp dot vim at google mail> (@xd1le on twitter)
# Previous maintainer: jsteel <mail at jsteel dot org>
# Contributor: scj <scm(at)archlinux(dot)com>
# Contributor: Jekyll Wu <adaptee(at)gmail(dot)com>

pkgname=lltag
pkgver=0.14.4
pkgrel=1
pkgdesc="Automatic command-line music (mp3/ogg/flac) file tagger and renamer"
arch=('i686' 'x86_64')
url="http://home.gna.org/lltag"
license=('GPL2')
depends=('perl')
optdepends=('mp3info: id3 support'
            'perl-mp3-tag: id3v2 support'
            'vorbis-tools: ogg support'
            'flac: FLAC support')
source=(http://download.gna.org/lltag/$pkgname-$pkgver.tar.bz2)
md5sums=('baa55ca592214e78671676492518170b')

build() {
  cd "$srcdir"/$pkgname-$pkgver

  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver

  make DESTDIR="$pkgdir" PREFIX=/usr SYSCONFDIR=/etc MANDIR=/usr/share/man \
    DOCDIR=/usr/share/doc/$pkgname-$pkgver install install-man install-doc
}
