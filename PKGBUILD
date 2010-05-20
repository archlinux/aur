# Maintainer: Ray Rashif <schivmeister@gmail.com>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>
# Contributor: sickhate <sickhate@tux-linux.net>

pkgname=solfege
pkgver=3.16.3
pkgrel=1
pkgdesc="Music education and ear training software"
arch=(i686 x86_64)
url="http://www.solfege.org/"
license=('GPL3')
depends=('pygtk' 'libgtkhtml')
makedepends=('ghostscript' 'gnome-doc-utils' 'librsvg' 'libxslt'
             'lilypond' 'swig' 'texinfo' 'txt2man' 'pkgconfig')
optdepends=('timidity++: Software MIDI support')
install=$pkgname.install
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz
        solfege.desktop)

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr \
              --sysconfdir=/etc

  make || return 1
  make DESTDIR="$pkgdir" install

  install -Dm644 ../$pkgname.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
}

md5sums=('f8faabc581747582e37dea2bf14313f6'
         '5bdd11173ead87fc4a42aff96535e961')
