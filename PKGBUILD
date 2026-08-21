# Maintainer: Versus Void <chaoskeeper somewhere at mail punctuation ru>
pkgname=reactotron
pkgver=3.11.0
pkgrel=1
pkgdesc="A desktop app for inspecting your React JS and React Native projects"
arch=('x86_64')
url="https://github.com/infinitered/reactotron"
license=('MIT')
source=("https://github.com/infinitered/reactotron/releases/download/reactotron-app%40$pkgver/reactotron-app-$pkgver.x86_64.rpm")
sha256sums=('d5375e69287a7937faf0589b9054e76ecb9f95734b0a6b5ec609ae689d70f9a1')
noextract=("${source[0]##*/}")

package() {
	bsdtar -xf reactotron-app-$pkgver.x86_64.rpm -C "$pkgdir"
	rm -r "$pkgdir/usr/lib"
	mkdir -p "$pkgdir/usr/bin"
	ln -sf /opt/Reactotron/reactotron-app "$pkgdir/usr/bin/reactotron"
}
