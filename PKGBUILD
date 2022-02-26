#Maintainer: Arnaud Joset <info [AT] agayon [DOT] be>

pkgname=('libervia-media-hg')
_realname=libervia-media
pkgver=0.8.r83.8427bdf59ea7
_version=0.8
pkgrel=1
url="https://salut-a-toi.org/"
arch=('any')
conflicts=('sat-media' 'sat-media-hg')
provides=('libervia-media')
license=('AGPL3')
source=("hg+https://repos.goffi.org/libervia-media")
md5sums=('SKIP')
options=('!strip')

pkgver() {
  cd "$_realname"
  printf "$_version.r%s.%s" "$(hg identify -n)" "$(hg identify -i)" 
}
                 
package(){
    pkgdesc="Salut à Toi, multi-frontends multi-purposes XMPP client (media files)"
    cd "$pkgdir"
    install -dm755 usr/share/libervia/media/
    cd "$srcdir/$_realname"
    cp -rv * $pkgdir/usr/share/libervia/media/

}
