#Maintainer : Sasasu <lizhaolong0123@gmail.com>
pkgname=uget-chrome-wrapper
pkgver=1.3.3
pkgrel=1
pkgdesc="Integrate uGet Download Manager with Google Chrome"
arch=('any')
url="https://github.com/slgobinath/uget-chrome-wrapper"
license=('GPL3')
depends=('python2' 'uget')
makedepends=()
source=("https://raw.githubusercontent.com/slgobinath/uget-chrome-wrapper/master/uget-chrome-wrapper/bin/uget-chrome-wrapper"
        "https://raw.githubusercontent.com/slgobinath/uget-chrome-wrapper/master/uget-chrome-wrapper/conf/com.javahelps.ugetchromewrapper.json")
md5sums=('309e95bbe764a9ec5271670ecdec1ddf'
         '6fef0c020c6aa8570862bd48546844d8')
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
