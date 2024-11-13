# Contributor: Myt1 <MYT1 @ QQ.com>

pkgname=51-android-git
pkgver=2.0.r24.g376b896
pkgrel=1
pkgdesc="Google USB Driver"
arch=('any')
url="https://github.com/snowdream/51-android"
license=('custom')
makedepends=('android-sdk-platform-tools')
source=(git+$url.git)
sha512sums=('SKIP')

pkgver() {
    cd ${pkgname%-git}
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/-/.r/;s/-/./'
}

package() {
	cd ${pkgname%-git}
	install -Dm644 "${pkgname%-git}.rules" -t $pkgdir/etc/udev/rules.d/
}
