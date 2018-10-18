# Maintainer: Mikael Blomstrand <mbloms ÅT kth DÖT se>
# Submiter to AUR: Pablo Lezaeta <prflr 88 (arro'a) gmail puntocom>
# Contributor: Philip Müller <philm@manjaro.org>
# Contributor: Lane Wiscombe <assassin.anex@gmail.com>

pkgbase=xcursor-maia
pkgname=xcursor-maia-git
provides=('xcursor-maia')
conflicts=('xcursor-maia')
_gitname=maia-cursor
pkgver=20160417
pkgrel=1
pkgdesc="Cursor theme - part of the Manjaro Maia set"
arch=('any')
url="https://gitlab.manjaro.org/artwork/cursors/maia-cursor"
license=('GPL3')
depends=('libxcursor')
makedepends=('binutils' 'git')
source=("git+$url.git"
	'thumbnail.png')
md5sums=('SKIP'
         '0a7352c3d38d4670fb38393ea4ac555c')

pkgver() {
    cd $_gitname
    git log -1 --format=%cd --date=format:%Y%m%d
}

package() {
    mkdir -p $pkgdir/usr/share/icons
    cp -a $srcdir/maia-cursor/Maia-Cursor/ $pkgdir/usr/share/icons/
    cp $srcdir/thumbnail.png $pkgdir/usr/share/icons/Maia-Cursor/cursors/
}
