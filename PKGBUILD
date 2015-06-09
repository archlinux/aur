# Maintainer: megadriver <megadriver at gmx dot com>

pkgname=barbie-seahorse-adventures
pkgver=1.0
pkgrel=4
pkgdesc="You're a seahorse - and you want to go to the moon!"
arch=('any')
url="http://www.imitationpickles.org/barbie/"
license=('GPL')
depends=('python2-pygame')
source=("http://www.imitationpickles.org/barbie/files/barbie-$pkgver.tar.gz" "barbie.desktop")
md5sums=('74e90654b74c7fffd4606102bc9b8bb3'
         'ce36c23657789918204aff3c354efd0a')

build() {
	cd $srcdir/barbie-$pkgver
	mkdir -p $pkgdir/usr/{bin,share/{barbie,applications}}
	cp -r run_game.py lib data $pkgdir/usr/share/barbie
	rm $pkgdir/usr/share/barbie/data/*.txt
	echo -e "#!/bin/bash\n\npython2 /usr/share/barbie/run_game.py" >> $pkgdir/usr/bin/barbie
	chmod 755 $pkgdir/usr/bin/barbie
	install -m755 -D $srcdir/barbie.desktop $pkgdir/usr/share/applications
}
