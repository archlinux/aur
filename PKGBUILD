# Maintainer: Develoopeer https://github.com/develoopeer/
pkgname=rofi-translater
pkgver=0.1.1
pkgrel=1
pkgdesc="Minimalistic rofi translating app"
arch=("any")
url="https://github.com/develoopeer/rofi-translater/"
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
license=('GPL')

build() {
	cd "$pkgname-$pkgver/src/"
	go build
}

package(){
	mkdir -p ~/.config/ttr/
	install -Dm755 "$pkgname-$pkgver/src/ttr" "$pkgdir"/usr/bin/ttr
	cp "$pkgname-$pkgver/launch.sh" ~/.config/ttr/
	cp -r "$pkgname-$pkgver/assets/" ~/.config/ttr/
}
sha256sums=('417a10486dbcb9ba5220b353be843959037f6fca6c4e3d8239a52f06b8e680ea')
