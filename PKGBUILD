# Maintainer: maximalisimus

pkgname=dmde-cli
pkgver=4.0.0.800
pkgrel=1
pkgdesc="DMDE is a powerful tool for data searching, editing, and recovery on disks - cli version"
arch=('x86_64')
url="https://dmde.ru/"
license=('custom')
depends=(sudo)
makedepends=(unzip)
replaces=($pkgname)

source_x86_64=("https://dmde.ru/download/dmde-4-0-0-800-lin64-con.zip")

source=(dmde-cli.desktop
		logo.png)

sha512sums=('1b6c947f0cf2ae001fe465031971b3b61fe79b7403ca1307f3693c4cc09b4a5c6698042b87fc95810f978ad152fa3edd46c5e22365b873e9b3959224f96ec2e1'
			'c32bbbb33b629b1953077fe9669a451c0adc308f94ce42c21e319ffe776695cb55c4d23831724186f966922a9fea073f8e65bb1f9a73afb5cb2e8075a0e5ebfe')

sha512sums_x86_64=('192777240f1869441e72eb2070cb0a11294e240fe946d2d47a91b9eac71d6075d8e12ed2560ed8d13fe8a14ac2ef39382d47326a3f98f19f8373faf668f36239')

package() {
	depends=(sudo)
	cd $srcdir
	mkdir -p ./usr/share/dmde-cli/ $pkgdir/usr/bin/ $pkgdir/usr/share/applications/ $pkgdir/usr/share/pixmaps/
	unzip ./dmde-4-0-0-800-lin64-con.zip -d $srcdir/usr/share/dmde-cli/
	cp -r usr $pkgdir
	chmod +x $pkgdir/usr/share/dmde-cli/dmde
	chmod +x $pkgdir/usr/share/dmde-cli/dmde-su.sh
	install -vDm644 $srcdir/logo.png $pkgdir/usr/share/pixmaps/$pkgname.png
	install -vDm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
	chmod +x $pkgdir/usr/share/applications/$pkgname.desktop
	ln -sr /usr/share/dmde-cli/dmde $pkgdir/usr/bin/dmde-cli
}
