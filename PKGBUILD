# Maintainer: stefonarch <standreas@riseup.net>
_pkgname=brightness-slider
pkgname=$_pkgname-git
pkgver=cf474da
pkgrel=1
pkgdesc="Brightness slider trayapp for external monitor in pyQt6"
arch=('any')
url="https://github.com/stefonarch/brightness-slider"
license=('GPLv2.0')
depends=('python' 'python-pyqt6' 'ddcutil')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git+https://github.com/stefonarch/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --always | sed "s/-/.r/;s/-/./"
}

package() {
  cd "$srcdir/$_pkgname"

  # Install script
  install -Dm755 brightness-slider "$pkgdir/usr/bin/brightness-slider"

  # Install desktop file
  install -Dm644 brightness_slider.desktop "$pkgdir/usr/share/applications/brightness_slider.desktop"
}
