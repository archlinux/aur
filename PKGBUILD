# Maintainer: syui <syui@users.noreply.github.com>
pkgname=medigo
pkgver=0.1
pkgrel=1
pkgdesc="Command line client for Medium"
arch=('x86_64' 'i686')
url="https://github.com/syui/medigo"
options=('!strip' '!emptydirs')
license=('MIT')
source=("$url/releases/download/$pkgver/linux_amd64_$pkgname"
        "$url/releases/download/$pkgver/linux_386_$pkgname")
noextract=(${source[@]%%::*})
sha1sums=('df39df00f1aed7211c2410889b60242176b12332'
'c48fb5dc4907e59050838d7a1c216caefd1f20c2')

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
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
	#sudo install -Dm755 "$pkgdir/usr/bin/$pkgname" /usr/bin
}

# vim:set ts=2 sw=2 et:
