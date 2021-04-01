# From the "Community" gcstar:
# Maintainer: outopos <spaceflorent at aol.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

_pkgname=gcstar
pkgname="${_pkgname}-gitlab"
pkgver=Test
pkgrel=1
pkgdesc="A collection management application"
arch=('any')
url="https://gitlab.com/Kerenoc/GCstar"
license=("GPL")
depends=('gtk2-perl' 'perl-gtk3' 'perl-gtk3-simplelist' 'perl-libwww' 'perl-xml-simple'
         'perl-net-snmp' 'perl-xml-parser' 'perl-switch'
         'perl-xml-libxml' 'perl-sort-naturally'
         'perl-http-message' 'perl-http-date' 'perl-http-cookies'
         'perl-gd' 'perl-date-calc'
         'perl-lwp-protocol-https'
         'perl-archive-zip' 'perl-datetime-format-strptime'
         'perl-gdgraph' 'perl-mp3-info'
         'perl-ogg-vorbis-header-pureperl' 'perl-mp3-tag'
         'perl-net-freedb' 'perl-image-exiftool'
         )
optdepends=(
       'gtk-engine-murrine'
)
makedepends=('git')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("git+https://gitlab.com/Kerenoc/GCstar.git")
md5sums=('SKIP')

package() {
  cd $srcdir/GCstar/$_pkgname
  ./install  --prefix=$pkgdir/usr
  install -D -m644 $pkgdir/usr/share/gcstar/icons/gcstar_256x256.png \
                   $pkgdir/usr/share/pixmaps/gcstar.png
  install -D -m644 $pkgdir/usr/share/gcstar/icons/gcstar_32x32.png \
                   $pkgdir/usr/share/pixmaps/gcstar32.png
  cp -R share/applications $pkgdir/usr/share
}
