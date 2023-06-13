# Maintainer: Piotr Miller <nwg.piotr@gmail.com>
pkgname=('t2ec')
pkgver=1.4
pkgrel=3
pkgdesc="Scripts to display info icons and controls in Tint2 or other panels"
arch=('x86_64')
url="https://github.com/nwg-piotr/tint2-executors"
license=('GPL3')
depends=('python' 'acpi' 'xorg-xbacklight' 'alsa-utils' 'wireless_tools' 'wget')
optdepends=('light: for machines not handling xbacklight'
	    'rof-git: for running mouse events commands as single instances'
	    'zenity: for volume and brightness slider box')

source=("https://github.com/nwg-piotr/t2ec/archive/v1.4.tar.gz")

md5sums=('5d3c99306d30da29998c39c6dea741eb')

package() {
  install -D -t "$pkgdir"/usr/lib/"$pkgname" "$pkgname"-"$pkgver"/scripts-arch/*.sh
  install -D -t "$pkgdir"/usr/lib/"$pkgname" "$pkgname"-"$pkgver"/scripts-arch/*.py
  install -D -t "$pkgdir"/usr/bin "$pkgname"-"$pkgver"/scripts-arch/t2ec
  install -D -t "$pkgdir"/usr/share/"$pkgname" "$pkgname"-"$pkgver"/images/*.svg
  install -D -t "$pkgdir"/usr/share/tint2 "$pkgname"-"$pkgver"/configs-arch/*.tint2rc
}

