# Maintainer: dalz <dalz @t disroot d0t org>
pkgname=moviebattles2
pkgver=1.6
pkgrel=1
pkgdesc="A fast-paced, action packed mod for Jedi Knight: Jedi Academy"
arch=('i686' 'x86_64')
url="https://www.moviebattles.org"
license=('unknown')
depends=('bin32-openjk')
source=(
    "$pkgname-$pkgver.zip::https://ams1.dl.dbolical.com/dl/2019/12/24/MovieBattlesII_FULL_V1.6.zip?st=5BgiG_F2n_94nnWuQj-0jg==&e=1578351939"
    'moviebattles2.desktop'
    'moviebattles2.png'
    'moviebattles2')
md5sums=(
    'c9fb616dd4ebb96e6a77c699d1a3e93a'
    '14d9db62e04f1cbed851ba7e098ff207'
    '3d20693ab4602ba56d61e9ee401e1dba'
    '400671872ffab35708b1acd1129b3797')
install=moviebattles2.install

package() {
    destdir=$pkgdir/opt/moviebattles2
    mkdir "$pkgdir/opt"

    cp -R "$srcdir" "$destdir"
    ln -s /opt/openjk/JediAcademy/{openjk.i386,openjk_sp.i386,openjkded.i386,rd-vanilla_i386.so,rdsp-vanilla_i386.so,base} "$destdir"

    install -D "$srcdir/moviebattles2.desktop" -t "$pkgdir/usr/share/applications/"
    install -Dm644 "$srcdir/moviebattles2.png" -t "$pkgdir/usr/share/pixmaps/"
    install -D "$srcdir/moviebattles2" -t "$pkgdir/usr/bin/"
}
