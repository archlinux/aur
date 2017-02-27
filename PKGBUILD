#Maintainer : Sasasu <lizhaolong0123@gmail.com>
pkgname=uget-chrome-wrapper
pkgver=2.0.3
pkgrel=2
pkgdesc="Integrate uGet Download Manager with Google Chrome"
arch=('any')
url="https://github.com/slgobinath/uget-chrome-wrapper"
license=('GPL3')
depends=('python3' 'uget')
makedepends=()
source=("https://raw.githubusercontent.com/slgobinath/uget-chrome-wrapper/6340d8b3084fd83a003dad92c4088e535fe3137f/uget-chrome-wrapper/bin/uget-chrome-wrapper"
        "https://raw.githubusercontent.com/slgobinath/uget-chrome-wrapper/6340d8b3084fd83a003dad92c4088e535fe3137f/uget-chrome-wrapper/conf/com.javahelps.ugetchromewrapper.json")
md5sums=('a17514359326453b84200660ff4cf764'
         '7c185094db349599f8375866796db33a')
install=uget-chrome-wrapper.install
build() {
	cd "$srcdir"/"$_pkgname"
}
package() {
	cd "$srcdir"/"$_pkgname"
	mkdir -p "$pkgdir/usr/bin"
	install -Dm755 "uget-chrome-wrapper" "$pkgdir"/usr/bin
	
	#for chrome if you not use chrome please delete them
	mkdir -p "$pkgdir/etc/opt/chrome/native-messaging-hosts"
	install -Dm644 "com.javahelps.ugetchromewrapper.json" "$pkgdir"/etc/opt/chrome/native-messaging-hosts
	
	#for chromium and Vivaldi if you not use chromium or vivaldi please delete them
	mkdir -p "$pkgdir/etc/chromium/native-messaging-hosts"
	install -Dm644 "com.javahelps.ugetchromewrapper.json" "$pkgdir"/etc/chromium/native-messaging-hosts
}
