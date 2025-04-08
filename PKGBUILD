# Maintainer: Matt Quintanilla <matt @ matt quintanilla . xyz>
# Contributor: Romain Porte <microjoe@microjoe.org>

pkgname=vue
pkgver=3.3.0
pkgrel=3
pkgdesc="Visual Understanding Environment"
arch=('any')
url="https://github.com/VUE/VUE"
license=('unknown')
depends=('java-environment' 'desktop-file-utils')
source=(https://github.com/VUE/VUE/releases/download/$pkgver/VUE.jar vue vue.png vue.desktop)
noextract=('VUE.jar')
md5sums=('4ac36729f42d000ac163add1b6c7a351'
         '1e7e76f1cbf6bba2f6a4e44dbfd75ee1'
         '9369da34c69baefc77a7baeaceb4e476'
         '5c9a02147f1acea93492dbdf7a6d2656')


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



