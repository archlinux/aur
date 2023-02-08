# Maintainer: Piotr Miller <nwg.piotr@gmail.com>
pkgname=('nwg-shell-config')
pkgver=0.4.15
pkgrel=1
pkgdesc="nwg-shell configuration utility"
arch=('x86_64')
url="https://github.com/nwg-piotr/nwg-shell-config"
license=('MIT')
provides=('nwg-shell-config')
conflicts=('nwg-shell-config' 'nwg-shell-config-git')
depends=('python' 'python-gobject' 'python-i3ipc' 'python-geopy' 'playerctl' 'gtklock' 'noto-fonts')
makedepends=('python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nwg-piotr/nwg-shell-config/archive/v"$pkgver".tar.gz")

md5sums=('5949fa79e428ecd9746b72eeef2626eb')

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  
  install -D -t "$pkgdir"/usr/share/pixmaps nwg-shell-config.svg
  install -D -t "$pkgdir"/usr/share/pixmaps nwg-shell-update.svg
  install -D -t "$pkgdir"/usr/share/pixmaps nwg-shell-translate.svg
  install -D -t "$pkgdir"/usr/share/pixmaps nwg-update-noupdate.svg
  install -D -t "$pkgdir"/usr/share/pixmaps nwg-update-available.svg
  install -D -t "$pkgdir"/usr/share/pixmaps nwg-update-checking.svg
  
  install -D -t "$pkgdir"/usr/share/applications nwg-shell-config.desktop
  install -D -t "$pkgdir"/usr/local/bin nwg-system-update
}
