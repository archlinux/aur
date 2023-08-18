# Maintainer: Mikhail Artamonov <maximalis171091@yandex.ru>
# makepkg --printsrcinfo > .SRCINFO && makepkg -scC --nocheck --skipchecksums --skipinteg --skippgpcheck

pkgname=dmde-cli
pkgver=4.0.6.806
pkgrel=1
pkgdesc="DMDE is a powerful tool for data searching, editing, and recovery on disks - cli version"
arch=('x86_64' 'i686')
url="https://dmde.ru/"
license=('custom')
depends=(sudo)
makedepends=(unzip)
replaces=($pkgname)

source_x86_64=("https://dmde.ru/download/dmde-4-0-6-806-lin64-con.zip")

source_i686=("https://dmde.ru/download/dmde-4-0-6-806-lin32-con.zip")

source=(dmde-cli.desktop
		logo.png)

sha512sums=('1b6c947f0cf2ae001fe465031971b3b61fe79b7403ca1307f3693c4cc09b4a5c6698042b87fc95810f978ad152fa3edd46c5e22365b873e9b3959224f96ec2e1'
			'c32bbbb33b629b1953077fe9669a451c0adc308f94ce42c21e319ffe776695cb55c4d23831724186f966922a9fea073f8e65bb1f9a73afb5cb2e8075a0e5ebfe')

sha512sums_x86_64=('f8d9a904f57c3c30905c90808301cd9268b535c64c1045c31cdf6682636c9c1adf78aa8968dbc1253bd07f9af375baa12b2f88326fe3d0b858891bb7511f245c')

sha512sums_i686=('1547997e6e60202468b024282955f251964b8827b9106f97300869f7e836c245a029bec35f9367a2cecd95c10ae5f461bf2c9ba2ff2934479ffdc4e8a38b080c')

package_i686() {
	depends=(sudo)
	cd $srcdir
	mkdir -p ./usr/share/dmde-cli/ $pkgdir/usr/bin/ $pkgdir/usr/share/applications/ $pkgdir/usr/share/pixmaps/
	unzip ./dmde-4-0-6-806-lin32-con.zip -d $srcdir/usr/share/dmde-cli/
	cp -r usr $pkgdir
	chmod +x $pkgdir/usr/share/dmde-cli/dmde
	chmod +x $pkgdir/usr/share/dmde-cli/dmde-su.sh
	install -vDm644 $srcdir/logo.png $pkgdir/usr/share/pixmaps/$pkgname.png
	install -vDm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
	chmod +x $pkgdir/usr/share/applications/$pkgname.desktop
	ln -sr /usr/share/dmde-cli/dmde $pkgdir/usr/bin/dmde-cli
}

package_x86_64() {
	depends=(sudo)
	cd $srcdir
	mkdir -p ./usr/share/dmde-cli/ $pkgdir/usr/bin/ $pkgdir/usr/share/applications/ $pkgdir/usr/share/pixmaps/
	unzip ./dmde-4-0-6-806-lin64-con.zip -d $srcdir/usr/share/dmde-cli/
	cp -r usr $pkgdir
	chmod +x $pkgdir/usr/share/dmde-cli/dmde
	chmod +x $pkgdir/usr/share/dmde-cli/dmde-su.sh
	install -vDm644 $srcdir/logo.png $pkgdir/usr/share/pixmaps/$pkgname.png
	install -vDm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
	chmod +x $pkgdir/usr/share/applications/$pkgname.desktop
	ln -sr /usr/share/dmde-cli/dmde $pkgdir/usr/bin/dmde-cli
}
