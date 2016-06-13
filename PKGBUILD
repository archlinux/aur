# Maintainer: Christopher Loen <christopherloen at gmail dot com>
pkgname=maltego-ce
pkgver=3.6.0.6640
pkgrel=1
pkgdesc="Community Edition of Maltego client"
arch=(any)
url="http://paterva.com/web6/products/maltego.php"
license=('Commercial')
depends=(jre8-openjdk)
source=("http://paterva.com/malv36/community/MaltegoChlorineCE.3.6.0.6640.deb")
md5sums=(7ff52656451d99fb1d52cc4e848dc2c9)

package() {
	cd "$srcdir"
	tar xf data.tar.gz
        install -dm755 "$pkgdir"/usr/share/ && install -dm755 "$pkgdir"/usr/bin
        cp -rf usr/share/* "$pkgdir"/usr/share/
        cp -rf usr/bin/* "$pkgdir"/usr/bin/
        mkdir info
        tar xf control.tar.gz -C info
        cp -rf info "$pkgdir"/usr/share/MaltegoChlorineCE/
}
