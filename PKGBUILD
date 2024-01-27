# Maintainer: Piotr Miller <nwg.piotr@gmail.com>
pkgname=('nwg-shell-config')
pkgver=0.5.32
pkgrel=1
pkgdesc="nwg-shell configuration utility"
arch=('any')
url="https://github.com/nwg-piotr/nwg-shell-config"
license=('MIT')
depends=('python' 'python-gobject' 'python-i3ipc' 'python-geopy' 'playerctl' 'gtklock' 'noto-fonts' 'wlsunset')
makedepends=('python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nwg-piotr/nwg-shell-config/archive/v"$pkgver".tar.gz")

md5sums=('9b6581790bdabbc9d907ec34899eaf0f')

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  
  install -D -t "$pkgdir"/usr/share/pixmaps nwg-shell-config.svg
  install -D -t "$pkgdir"/usr/share/pixmaps nwg-shell-update.svg
  install -D -t "$pkgdir"/usr/share/pixmaps nwg-shell-translate.svg
  install -D -t "$pkgdir"/usr/share/pixmaps nwg-update-noupdate.svg
  install -D -t "$pkgdir"/usr/share/pixmaps nwg-update-available.svg
  install -D -t "$pkgdir"/usr/share/pixmaps nwg-update-checking.svg
  install -D -t "$pkgdir"/usr/share/pixmaps nwg-screenshot.svg
  install -D -t "$pkgdir"/usr/share/pixmaps nwg-3.svg
  install -D -t "$pkgdir"/usr/share/pixmaps nwg-2.svg
  install -D -t "$pkgdir"/usr/share/pixmaps nwg-1.svg
  
  install -D -t "$pkgdir"/usr/share/applications nwg-shell-config.desktop
  install -D -t "$pkgdir"/usr/local/bin nwg-system-update
  install -D -t "$pkgdir"/usr/share/licenses/"$pkgname" LICENSE
  install -D -t "$pkgdir"/usr/share/doc/"$pkgname" README.md
}
