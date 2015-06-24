#  Maintainer: Loui Chang <base64:bG91aXBjLmlzdEBnbWFpbC5jb20=>
# Contributor: Matthias Hueser <mail at mhueser dot de>
# Contributor: Daniel Griffiths <ghost1227 at archlinux dot us>

pkgname=rolo
pkgver=011
pkgrel=4
pkgdesc="Tracks your contacts with vCards and displays them to you with
 a text-based menu."
arch=('i686' 'x86_64')
url="http://rolo.sourceforge.net"
license=('GPL')
depends=('ncurses' 'libvc')
source=(http://sourceforge.net/projects/rolo/files/rolo/011/rolo-011.tar.gz)

# Patches copied from
# https://anonscm.debian.org/cgit/users/rafael/deb-pkg/rolo.git
# Commented out ones I thought were a bit overreaching

source+=(
    manpage-close-list.diff
    refresh-index-empty.diff
    drop-rolorc-manpage.diff
#    display-types.diff
#    use-usr-bin-editor.diff
#    display-multiple-addresses.diff
    use-ncursesw.diff
#    utf8-in-index.diff
    drop-libform.diff
#    compare-in-utf-8.diff
)

build() {
  cd $srcdir/$pkgname-$pkgver

    patch -p1 < ../manpage-close-list.diff
    patch -p1 < ../refresh-index-empty.diff
    patch -p1 < ../drop-rolorc-manpage.diff
#    patch -p1 < ../display-types.diff
#    patch -p1 < ../use-usr-bin-editor.diff
#    patch -p1 < ../display-multiple-addresses.diff
    patch -p1 < ../use-ncursesw.diff
#    patch -p1 < ../utf8-in-index.diff
    patch -p1 < ../drop-libform.diff
#    patch -p1 < ../compare-in-utf-8.diff

  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

md5sums=(
    'c7478cdcc8179cb01755565901135e5e'
    '3a944bf930363d585f1fe5b7201e6757'
    'dc68661245692efb127b29f64aa9cc98'
    '2013dc0709425ef761e8f90e85b0b6a2'
#    '2f042e2e6e2147901b83b1bf99600a96'
#    '6dbc3c454650ec6b6b9ef75f65154e4a'
#    'd7629629831e674d65b4cc8e1696c50c'
    '69ca99eff67e1cc7f7231fec3bb72ee4'
#    'b7fcb4b3030fb044062fa79f822cec01'
    'dc493c8f214a17e5a9e954ab052547f6'
#    '0d7e72bfe133e561be1bde232d59e153'
)
sha256sums=(
    '83edfb7f2de66556fb8fb516ff40dc152ae3af1f19876086ad9ec23a4abbe0e3'
    '383fb7aa07d0f0db76c7a03a3e0967a559660861a025df1992e30e35d70db803'
    'ac90483da10ab6da25e4fd696cd3a499246eedcc314125cbea54550bf64b69b6'
    '49f2fc9760756fd25f48078307dfa8121d630053d6cde19fcfb6c6e9d11df70f'
#    '2569d68f88488e599929df01a14c8ab5119d3b31cfcc81bcd4f32998d82b0015'
#    '2a5bb28f6e53f10f9cfb9dac6e80c65c41e4a68535c5881c8f5f10adb6e04ae5'
#    'ce338ba0afb65e705910c206f4d555bafef6a78ba7d3ed4a0fbc8056fcc370e1'
    '7373f0a5a8c1d9a08cd424903563d03a3fb040d4c54c786ad23956eedf4448c5'
#    '56825f5d7d791bbbc1c01290708eaf82c6ebfe710a20f037ee91446dc99bec4c'
    'ca0922907a9e4cc41c3c941c201b59926948b05d7e294f03430ceec643db0aaa'
#    '4a658c26ca8eb6207faa3c439d52dbf3462f6f3eb79d8b22ea9ba00d6ceb755c'
)
