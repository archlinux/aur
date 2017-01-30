# Maintainer: not_anonymous <nmlibertarian@gmail.com>

pkgname=pydxcluster
pkgver=2.21
pkgrel=1
pkgdesc="Python2 (tk) Ham Radio DX-Cluster GUI"
_dist=pyDxCluster
__dist=pyDXCluster
_ver=v2_21
arch=('any')
url="http://sourceforge.net/projects/pydxcluster/"
license=('GPL3')
depends=('python2-requests' 'python2-pygame')
source=(https://downloads.sourceforge.net/project/$pkgname/$__dist%20v$pkgver/${__dist}_$_ver.tar.gz
        $pkgname.desktop
        $pkgname.png
	$pkgname.1)

prepare() {
	cd $srcdir

	mv ${_dist}_${_ver}.py $pkgname.py
	rm -f *.txt
	sed -i 's:LICENSE:/usr/share/licenses/common/GPL3/license:' $pkgname.py
}

package() {
	cd $srcdir

	mkdir -p $pkgdir/usr/share/$pkgname
	cp *.col $pkgdir/usr/share/$pkgname
	cp *.cfg $pkgdir/usr/share/$pkgname
	cp *.py $pkgdir/usr/share/$pkgname
	install -D -m 644 *.wav $pkgdir/usr/share/$pkgname

	mkdir -p $pkgdir/usr/bin
	install -D -m 755 $pkgname.1 $pkgdir/usr/bin/$pkgname

	mkdir -p $pkgdir/usr/share/{applications,pixmaps}
	install -D -m 644 $pkgname.png $pkgdir/usr/share/pixmaps
	install -D -m 644 $pkgname.desktop $pkgdir/usr/share/applications
}
md5sums=('d49f29f55cadf08c60c65b0d92dd8e8a'
         '047de11f8b1f7a2433008d10732341da'
         'd03076d6792be993b1d52cece985373d'
         '64f0cac2f172f022edeb2e27e8c36841')
sha256sums=('f6dc61f23edda77d1346082ba7b14ab3f627a6cd746fd7db04de361975bf1e2c'
            'b79a160b020a66a2f02d6bda7c5e1772c01c74fce4caa6a3eb5e8eeeb506a83e'
            '797cd5764b045edf71c95f2b874d2705e8296460730e80e2b32311b6705c33a8'
            '470797e4d8a4dddce8c07cd4baf7559cd6635b28e80abd013b0acefbfda1a476')
