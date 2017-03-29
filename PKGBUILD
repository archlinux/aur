# Maintainer: syui <syui@users.noreply.github.com>
pkgname=ipinfo
pkgver=0.1
pkgrel=1
arch=('x86_64' 'i686')
url="https://github.com/syui/ipinfo"
license=('MIT')
source=("$url/releases/download/$pkgver/linux_amd64_$pkgname"
        "$url/releases/download/$pkgver/linux_386_$pkgname")
sha1sums=('8b8ea04b4b2188023f0c8529e93e2275bd881744'
'20326402fe40bc69128b73bfa0d98911128b984f')

package() {
	mkdir -p ${srcdir}/${pkgname}-${pkgver}
	cd "${srcdir}/${pkgname}-${pkgver}"
	if [ "`uname -m`" = "x86_64" ];then
		mv ../linux_amd64_$pkgname $pkgname 
		chmod +x $pkgname
	fi
	if [ "`uname -m`" = "i684" ];then
		mv ../linux_386_$pkgname $pkgname 
		chmod +x $pkgname
	fi
	sudo cp -rf $pkgname $pkgdir
}

