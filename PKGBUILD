# Maintainer: Romain Porte <microjoe@mailoo.org>

pkgname=vue
pkgver=3.3.0
pkgrel=1
pkgdesc="Visual Understanding Environment"
arch=('any')
url="https://github.com/VUE/VUE"
license=('unknown')
depends=('java-environment' 'desktop-file-utils')
source=(https://github.com/VUE/VUE/releases/download/$pkgver/VUE.jar vue vue.png vue.desktop)
noextract=('VUE.jar')
md5sums=('4ac36729f42d000ac163add1b6c7a351'
	'af196991a58733c5c0742aace0439639'
	'9369da34c69baefc77a7baeaceb4e476'
	'3900bc2cfca99500f4dc38cda75ebd06')


package() {
	install -Dm755 VUE.jar $pkgdir/opt/$pkgname/VUE.jar
	install -Dm755 vue $pkgdir/usr/bin/vue
	install -Dm644 vue.png $pkgdir/opt/$pkgname/vue.png
	install -Dm644 vue.desktop $pkgdir/usr/local/share/applications/vue.desktop
}

post_install() {
	update-desktop-database -q
}

post_remove() {
	update-desktop-database -q
}



