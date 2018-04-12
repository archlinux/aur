# Maintainer: robertfoster

pkgname=ajo
pkgver=1.0.9
pkgrel=1
pkgdesc="Asynchronous Job Operator: a transparent gateway between your web, application or service and an HPC system."
arch=('i686' 'x86_64')
url="https://rdlab.cs.upc.edu/index.php/en/services/ajo.html"
license=('GPL3')
depends=('ruby')
source=("https://rdlab.cs.upc.edu/releases/ajo/$pkgname.v-$pkgver.tar.gz"
	"$pkgname.sh")

package() {
	cd hpc/ajo*
	install -dm755 $pkgdir/usr/lib/ruby/site_ruby/ajo
	cp libhpc.rb $pkgdir/usr/lib/ruby/site_ruby/	
	cp ajo $pkgdir/usr/lib/ruby/site_ruby/ajo
	install -Dm755 config.rb $pkgdir/etc/ajo/config.rb
	install -Dm755 $srcdir/ajo.sh $pkgdir/usr/bin/ajo	
}

md5sums=('07d8790852297d5f493bb8e224e1f143'
         '313e3c6e2aff88b05c141f18132834fd')
