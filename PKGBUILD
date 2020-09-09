# Maintainer: Popolon <popolon@popolon.org>

pkgname=networktablet
pkgver=1.5
pkgrel=1
pkgdesc="Linux driver for Android GfxTablet input"
arch=(x86_64 armv7h armv8)
url="http://rfc2822.github.io/GfxTablet/"
license=('GPL3')
source=("https://github.com/rfc2822/GfxTablet/archive/android-app-1.4-linux-driver-$pkgver.tar.gz")
sha512sums=('3f56c4982c95d0be4588424af9c8046e59a4bd7f310738fdc6099a4f93e1b58bf82d8730139167f74d86001e31fd6def20752405c15683ceeb04f7efa3f7c801')

build() {
  cd GfxTablet-android-app-1.4-linux-driver-$pkgver/driver-uinput/
  make
}

package() {
  cd GfxTablet-android-app-1.4-linux-driver-$pkgver
  install -D driver-uinput/networktablet "$pkgdir"/usr/bin/networktablet
  install -Dm 644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
