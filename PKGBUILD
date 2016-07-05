# Maintainer : Florent H. CARRÉ <colundrum@gmail.com>
pkgname=qarte
pkgver=3.0.4
pkgrel=2
pkgdesc='Allow you to browse into the archive of arte+7 & arteLiveWeb sites and to record your prefered videos.'
url='https://launchpad.net/qarte'
arch=('i686' 'x86_64')
license=('GPL3')
source=(http://ppa.launchpad.net/vincent-vandevyvre/vvv/ubuntu/pool/main/q/qarte/${pkgname}_${pkgver}.orig.tar.gz)
depends=('qt5-translations' 'python-pyqt5')
optdepends=('cronie: for differed download')
md5sums=('5f84ef5b5e64a75ac90aab3cbf8a1e62')

package() {
	cd $srcdir/${pkgname}-${pkgver}

	# Man compression
	gzip qarte.1

	bin_dir="$pkgdir/usr/bin"
	man_dir="$pkgdir/usr/share/man/man1"
	application_dir="$pkgdir/usr/share/applications"
	pixmaps_dir="$pkgdir/usr/share/pixmaps"
	qarte_dir="$pkgdir/usr/share/${pkgname}"

	mkdir -p $bin_dir
	mkdir -p $man_dir
	mkdir -p $application_dir
	mkdir -p $pixmaps_dir
	mkdir -p $qarte_dir

	mv qarte $bin_dir
	mv qarte.1.gz $man_dir
	mv q_arte.desktop $application_dir
	mv qarte.png $pixmaps_dir
	chmod 0644 $pixmaps_dir/qarte.png
	mv * $qarte_dir
}
