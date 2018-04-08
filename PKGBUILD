#Maintainer: Arnaud Joset <info [AT] agayon [DOT] be>

pkgname=('sat-media-hg')
_realname=sat_media
pkgver=0.7.r46.3cd7354ab2dc
VERSION=0.7
pkgrel=1
url="https://salut-a-toi.org/"
arch=('any')
depends=('python2')
makedepends=('')
conflicts=('sat-media')
provides=('sat-media')
license=('AGPL3')
source=("hg+https://repos.goffi.org/sat_media")
md5sums=('SKIP')
options=('!strip')

pkgver() {
  cd "$_realname"
  printf "$VERSION.r%s.%s" "$(hg identify -n)" "$(hg identify -i)" 
}


                 
package(){
    pkgdesc="Salut à Toi, multi-frontends multi-purposes XMPP client (media files)"

    cd "$pkgdir"
    install -dm755 usr/share/sat/media/

    cd "$srcdir/$_realname"
    cp -rv * $pkgdir/usr/share/sat/media/

}

