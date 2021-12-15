# Maintainer: zocker_160 <zocker1600 at posteo dot net>

pkgname=thinkfan-ui
pkgver=0.8
pkgrel=1
pkgdesc="A small gui app for Linux to control the fan speed and monitor temps on a ThinkPad"
arch=('x86_64')
url="https://github.com/zocker-160/thinkfan-ui"
license=('GPL v3')
depends=('python>=3.6' 'python-pyqt5>=5.11' 'lm_sensors')
#conflicts=('')
source=("$pkgname-$pkgver.tar.gz::https://github.com/zocker-160/thinkfan-ui/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('cdf7597e1906d09ad97153ac8907f848ba2d297f5991b54c4a51a9c628b13cbb')

install=thinkfan-ui.install

build() {
  cd $srcdir/$pkgname-$pkgver
  # nothing to see here
}

package() {
  cd $srcdir/$pkgname-$pkgver
  
  install -d -m755 src "$pkgdir"/usr/lib/"$pkgname"
  cp -r src/* "$pkgdir"/usr/lib/"$pkgname"
  install -D -m755 linux_packaging/assets/thinkfan-ui -t "$pkgdir"/usr/bin
  
  install -D -m644 linux_packaging/assets/thinkfan-ui.svg -t "$pkgdir"/usr/share/icons/hicolor/scalable/apps
  install -D -m644 linux_packaging/assets/thinkfan-ui.desktop -t "$pkgdir"/usr/share/applications
}
