#Maintainer : Sasasu <lizhaolong0123@gmail.com>
pkgname=uget-chrome-wrapper
pkgver=1.2
pkgrel=1
pkgdesc="Integrate uGet Download Manager with Google Chrome"
arch=('any')
url="https://github.com/slgobinath/uget-chrome-wrapper"
license=('GPL3')
depends=('python2' 'uget')
makedepends=()
source=("https://raw.githubusercontent.com/slgobinath/uget-chrome-wrapper/master/uget-chrome-wrapper/bin/uget-chrome-wrapper"
        "https://raw.githubusercontent.com/slgobinath/uget-chrome-wrapper/master/uget-chrome-wrapper/conf/com.javahelps.ugetchromewrapper.json")
md5sums=('c3b9166f09d25b51576cb771552b3f2a' '6fef0c020c6aa8570862bd48546844d8')
browser=opt/chrome
#browser=chromium #if you use chromium
install=uget-chrome-wrapper.install
build() {
	cd "$srcdir"/"$_pkgname"
}
package() {
	cd "$srcdir"/"$_pkgname"
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/etc/$browser/native-messaging-hosts"

	install -Dm755 "uget-chrome-wrapper" "$pkgdir"/usr/bin
	install -Dm644 "com.javahelps.ugetchromewrapper.json" "$pkgdir"/etc/$browser/native-messaging-hosts
}
