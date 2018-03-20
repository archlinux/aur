# Contributor: Florian Pritz <f-p@gmx.at>
pkgname=inxi
pkgver=2.3.56
pkgrel=1
pkgdesc="script to get system information"
arch=('any')
url="http://inxi.org"
license=('GPL')
depends=(coreutils gawk grep pciutils procps-ng sed)
optdepends=(
  "dmidecode: inxi -M if no sys machine data"
  "file: inxi -o unmounted file system"
  "hddtemp: inxi -Dx show hdd temp"
  "net-tools: inxi -i ip lan-deprecated"
  "iproute2: inxi -i ip lan"
  "lm_sensors: inxi -s sensors output"
  "usbutils: inxi -A usb audio;-N usb networking"
  "kmod: inxi -Ax,-Nx module version"
  "systemd-sysvcompat: inxi -I runlevel"
  "sudo: inxi -Dx hddtemp-user;-o file-user"
  "mesa-demos: inxi -G glx info"
  "xorg-xdpyinfo: inxi -G multi screen resolution"
  "xorg-xprop: inxi -S desktop data"
  "xorg-xrandr: inxi -G single screen resolution"
)
source=(https://sources.archlinux.org/other/community/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('8cde8559d31b82d478bc1a5788cc7bcd')

package() {
  cd "$srcdir"
  install -D -m755 inxi "$pkgdir/usr/bin/inxi"
  install -D -m755 inxi.1.gz "$pkgdir/usr/share/man/man1/inxi.1.gz"
}

# vim:set ts=2 sw=2 et:
