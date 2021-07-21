# Maintainer: zocker_160 <zocker1600 at posteo dot net>

pkgname=thinkfan-ui
pkgver=0.7
pkgrel=1
pkgdesc="A small gui app for Linux to control the fan speed and monitor temps on a ThinkPad"
arch=('x86_64')
url="https://github.com/zocker-160/thinkfan-ui"
license=('unknown')
depends=('python>=3.6' 'python-pyqt5>=5.11' 'lm_sensors')
#conflicts=('')
source=("$pkgname-$pkgver.tar.gz::https://github.com/zocker-160/thinkfan-ui/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('7726bf3e474fa35fcc349c6036145f1bccb4b01f16de36fd0f367b3f08755462')

build() {
  cd $srcdir/$pkgname-$pkgver
  # nothing to see here
}

package() {
  cd $srcdir/$pkgname-$pkgver
  
  install -d -m755 src "$pkgdir"/usr/lib/"$pkgname"
  cp -r src/* "$pkgdir"/usr/lib/"$pkgname"
  install -D -m755 linux_packaging/thinkfan-ui -t "$pkgdir"/usr/bin
  
  install -D -m644 linux_packaging/thinkfan-ui.svg -t "$pkgdir"/usr/share/icons/hicolor/scalable/apps
  install -D -m644 linux_packaging/thinkfan-ui.desktop -t "$pkgdir"/usr/share/applications
}
