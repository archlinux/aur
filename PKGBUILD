 
# Maintainer: Emile Pesik <ristridin [at] gmail [dot] com>

pkgname=gtksetpwc
pkgver=0.2
pkgrel=2
pkgdesc="GTK2 frontend for setpwc"
arch=('i686' 'x86_64')
url="http://gtksetpwc.spiderou.net/"
license=('custom:"CeCILL"')
depends=('setpwc' 'perl' 'gtk2-perl')
source=("http://gtksetpwc.spiderou.net/files/$pkgname-$pkgver.tar.bz2"
"http://gtksetpwc.spiderou.net/files/webcam.png"
'gtksetpwc.desktop')
noextract=()
md5sums=('d8702f6a8405e84ea89eae36d6b6ae2e'  # tarball
	 '76f6153d38d87b53bed8d19c9947d6fe'  # webcam.png
	 '0ed9dcbf01784d40b9328ecdfe508e4e') # gtksetpwc.desktop

package() {
    # install binary
    install -Dm755 "$srcdir/$pkgname/gtksetpwc.pl" \
        "$pkgdir/usr/bin/gtksetpwc.pl" || return 1

    # install desktop files
    install -Dm644 "$srcdir/gtksetpwc.desktop" \
        "$pkgdir/usr/share/applications/gtksetpwc.desktop" || return 1
    install -Dm644 "$srcdir/webcam.png" \
        "$pkgdir/usr/share/pixmaps/gtksetpwc.png" || return 1

    # install license files
    install -Dm644 "$srcdir/$pkgname/LICENCE.EN" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENCE.EN" || return 1
    install -Dm644 "$srcdir/$pkgname/LICENCE.FR" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENCE.FR" || return 1
    }
