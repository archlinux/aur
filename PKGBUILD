# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: Vitaliy Berdinskikh ur6lad[at]i.ua
# Original Submitter: Bob Finch <w9ya@qrparci.net>

pkgname=fdlog
pkgver=155m
pkgverex=rc7
pkgrel=1
pkgdesc="Ham Radio - Field Day Logger with networked nodes"
arch=('any')
url="http://www.fdlog.info"
license=('GPL-2.0-or-later')
depends=('python3' 'python-pyserial' 'python-pyaudio' 'tk' 'epdfview' 'sqlite' 'hamradio-menus')
source=("${pkgname}${pkgver}-${pkgverex}.zip::https://drive.google.com/uc?export=download&id=1Jry1BzQcMC7JJblhR8JtetDBI7R8Xp9k"
#https://drive.google.com/file/d/1Jry1BzQcMC7JJblhR8JtetDBI7R8Xp9k"
#https://drive.google.com/uc?export=download&id=1k3wuKxC1CcbAijApiLpLTZGx4wbsyaiw"
#${url}/files/$pkgname$pkgver.zip
#	${url}/files/arrl_sect.txt
#	http://www.arrl.org/files/file/Field-Day/2017/2017%20Rules.pdf
#	https://www.arrl.org/files/file/Regulatory/Band%20Chart/Band%20Chart%20-%2011X17%20Color.pdf
#	diff.linux.patch.de.kd8kbu
	$pkgname.1
	$pkgname.desktop
	$pkgname.png)

#prepare() {
#	cd $srcdir/${pkgname}$pkgver
#
#	mv README.txt readme.txt
#	rm GPL.txt
#
#	sed -i -e 's:os.startfile:os.system:' fdlog.py
#	sed -i -e 's:fdrules.pdf:epdfview fdrules.pdf:' fdlog.py
#	sed -i -e 's:bands.pdf:epdfview bands.pdf:' fdlog.py
#
#	patch -p0 < ../diff.linux.patch.de.kd8kbu
#}

package() {
#	cd $srcdir/${pkgname}$pkgver
	cd $srcdir/${pkgname}${pkgver}-${pkgverex}

	mkdir -p $pkgdir/usr/share/$pkgname
	install -m 644 * $pkgdir/usr/share/$pkgname/
#	install -m 644 ../arrl_sect.txt $pkgdir/usr/share/$pkgname/arrl_sect.txt
#	install -m 644 ../2017%20Rules.pdf $pkgdir/usr/share/$pkgname/fdrules.pdf
#	install -m 644 ../Band%20Chart%20-%2011X17%20Color.pdf $pkgdir/usr/share/$pkgname/bands.pdf
	install -D -m 755 ../$pkgname.1 $pkgdir/usr/bin/$pkgname

	mkdir -p $pkgdir/usr/share/{applications,pixmaps}
	install -m644 ../*.desktop $pkgdir/usr/share/applications/
	install -m644 ../*.png $pkgdir/usr/share/pixmaps/
}
md5sums=('2106c793f108e54d01db30fea4ffe4b8'
         'abad30875130ace4210e24db7008c1f5'
         'ed55981d519bc7a1644183d913ba54a0'
         '222f239adce839cd07d4fff44fac3ee8')
sha256sums=('2c806ffcf13b1ff74c17c545f2d06a6d10fbc0fcd1eb96028724febf8b3269f8'
            '86ccf638aabeccbbd0c13b38a413e18a18a3ec59a92a46752fea852924da9c04'
            'aea54578f79ef0aa7ca91eb5a52ddad92429379d40d97fc9f87234073bfc81ce'
            '5e3e7867385997b5a11c231d32f9429e09f234f50882ff8385241f4cbf92b500')
