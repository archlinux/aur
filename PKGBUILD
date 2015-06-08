# Maintainer: Willem Herremans <whpgf at scarlet.be>
pkgname=tkpacman
pkgver=1.5.0
pkgrel=1
pkgdesc="A lightweight GUI for pacman built with Tcl/Tk"
arch=('any')
url="http://sourceforge.net/projects/tkpacman"
license=('GPL')
depends=('tcl>=8.6.0' 'tk>=8.6.0')
optdepends=('sudo: if you want to use sudo instead of su'
            'gksu: if you want to use gksu instead of su or sudo'
            'kdebase-runtime: if you want to use kdesu'
            'lxterminal: recommended as terminal emulator'
            'xterm: alternative terminal emulator'
            'vte: alternative terminal emulator'
            'xfce4-terminal: alternative terminal emulator'
            'konsole: alternative terminal emulator'
            'roxterm: alternative terminal emulator')
source=(http://downloads.sourceforge.net/tkpacman/tkpacman-$pkgver/tkpacman-$pkgver.tar.gz)
#source=(tkpacman-$pkgver.tar.gz)
md5sums=('b8ba72d64bc798fd9b5a6d85cef0ba79')

package() {
    cd "$srcdir/$pkgname-$pkgver"
#   /usr/share/tkpacman
    install -d $pkgdir/usr/share/tkpacman
    install -m644 config.tcl $pkgdir/usr/share/tkpacman
    install -m644 generic.tcl $pkgdir/usr/share/tkpacman
    install -m755 main.tcl $pkgdir/usr/share/tkpacman
    install -m644 misc.tcl $pkgdir/usr/share/tkpacman
    install -m644 options.tcl $pkgdir/usr/share/tkpacman
#   /usr/share/tkpacman/icons
    install -d $pkgdir/usr/share/tkpacman/icons
    install -m644 icons/* $pkgdir/usr/share/tkpacman/icons/
#   /usr/share/tkpacman/msgs
    install -d $pkgdir/usr/share/tkpacman/msgs
    install -m644 msgs/* $pkgdir/usr/share/tkpacman/msgs/
#   /usr/share/tkpacman/askpass
    install -d $pkgdir/usr/share/tkpacman/askpass
    install -m755 askpass/askpass.tcl $pkgdir/usr/share/tkpacman/askpass/
#   /usr/share/tkpacman/askpass/msgs
    install -d $pkgdir/usr/share/tkpacman/askpass/msgs
    install -m644 askpass/msgs/* $pkgdir/usr/share/tkpacman/askpass/msgs/
#   /usr/bin
    install -d $pkgdir/usr/bin
    install -m755 tkpacman $pkgdir/usr/bin/
#   /usr/share/applications
    install -d $pkgdir/usr/share/applications
    install -m644 tkpacman.desktop $pkgdir/usr/share/applications/
#   /usr/share/doc/tkpacman
    install -d $pkgdir/usr/share/doc/tkpacman
    install -m644 README.txt $pkgdir/usr/share/doc/tkpacman/
    install -m644 CHANGE_LOG.txt $pkgdir/usr/share/doc/tkpacman/
    install -d $pkgdir/usr/share/doc/tkpacman/en
    install -m644 doc/en/help.txt $pkgdir/usr/share/doc/tkpacman/en
    install -d $pkgdir/usr/share/doc/tkpacman/nl
    install -m644 doc/nl/help.txt $pkgdir/usr/share/doc/tkpacman/nl
}
