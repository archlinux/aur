# Maintainer: M0Rf30

pkgname=feedworker-itasa
pkgver=2.0.3
pkgrel=2
pkgdesc="Subtitles client to download the latest updates on Itasa (italiansubs.net)"
arch=("i686" "x86_64")
url="http://www.italiansubs.net/index.php?option=com_content&view=article&id=6991&Itemid=88"
license=('GPL')
depends=('java-runtime-headless')
source=(http://www.italiansubs.net/software/FeedWorkerItasa_203.zip)

package() {
	cd $srcdir/FeedWorkerItasa
	install -d -m777 $pkgdir/opt/feedworkeritasa/
        cp -r {lib,FeedWorkerItasa.jar} $pkgdir/opt/feedworkeritasa/
	install -d -m755 $pkgdir/usr/bin
        echo "#!/bin/bash" >> $pkgdir/usr/bin/feedworkeritasa
	echo "cd /opt/feedworkeritasa/" >> $pkgdir/usr/bin/feedworkeritasa
	echo "java -jar "FeedWorkerItasa.jar"" >> $pkgdir/usr/bin/feedworkeritasa
        chmod +x $pkgdir/usr/bin/feedworkeritasa
}


md5sums=('e1c08a772167494d6328a0882639a3c4')
