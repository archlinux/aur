# Maintainer: Manuel Alcocer Jiménez <m.alcocer1978@gmail.com>
pkgname=caja-script-audacious
pkgver=r5.e7c5347
pkgrel=1
pkgdesc="Caja-script for adding files to audacious playlist"
arch=('any')
url=('https://github.com/nashgul/caja-script-audacious')
license=('GPL')
depends=('audacious' 'zenity')
makedepends=('git')
checkdepends=('audacious' 'zenity')
install=$pkgname.install
source=('git://github.com/nashgul/caja-script-audacious.git')
md5sums=('SKIP')

pkgver(){
	cd $pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package(){
	cd $srcdir/caja-script-audacious
	install -Dm644 add_to_audacious.sh $pkgdir/usr/share/caja/scripts/add_to_audacious.sh
	install -Dm644 README.md $pkgdir/usr/share/doc/caja-script-audacious/readme.doc
}
