# Maintainer: zocker_160 <zocker1600 at posteo dot net>

pkgname=thinkfan-ui
pkgver=1.0.0
pkgrel=1
pkgdesc="A small gui app for Linux to control the fan speed and monitor temps on a ThinkPad"
arch=('x86_64')
url="https://github.com/zocker-160/thinkfan-ui"
license=('GPLv3')
depends=('python>=3.12' 'python-pyqt6>=6.9' 'qt6-svg>=6.9' 'lm_sensors')
makedepends=('git')
#conflicts=('')
source=("git+https://github.com/zocker-160/thinkfan-ui.git#tag=$pkgver")
sha256sums=('SKIP')

install=thinkfan-ui.install

build() {
  cd "$srcdir/$pkgname"
  # nothing to see here
}

package() {
  cd "$srcdir/$pkgname"

  mkdir -p "$pkgdir/opt/$pkgname"
  cp -r src/* "$pkgdir/opt/$pkgname"

  install -D -m755 linux_packaging/thinkfan-ui -t "$pkgdir/usr/bin"
  install -D -m644 linux_packaging/thinkfan-ui.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
  install -D -m644 linux_packaging/thinkfan-ui.desktop -t "$pkgdir/usr/share/applications"
  install -D -m644 linux_packaging/modules-load.conf "$pkgdir/usr/lib/modules-load.d/$pkgname.conf"
}
