# Maintainer: Versus Void <chaoskeeper somewhere at mail punctuation ru>
pkgname=reactotron
pkgver=3.7.7
pkgrel=1
pkgdesc="A desktop app for inspecting your React JS and React Native projects"
arch=('x86_64')
url="https://github.com/infinitered/reactotron"
license=('MIT')
source=("https://github.com/infinitered/reactotron/releases/download/reactotron-app%40$pkgver/reactotron-app-$pkgver.x86_64.rpm")
sha256sums=('274ca431a25854687905945809683659ff856cacd65ceef5697586d9763a0a9a')
noextract=("${source[0]##*/}")

package() {
	bsdtar -xf reactotron-app-$pkgver.x86_64.rpm -C "$pkgdir"
	rm -r "$pkgdir/usr/lib"
	mkdir -p "$pkgdir/usr/bin"
	ln -sf /opt/Reactotron/reactotron-app "$pkgdir/usr/bin/reactotron"
}
