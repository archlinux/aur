# Maintainer: justbrowsing <developer4linux+aur@gmail.com>
pkgname=justbrowsing-syslinux
pkgver=2014.08
pkgrel=1
pkgdesc="Syslinux config files for JustBrowsing LiveCD"
arch=('any')
url="https://github.com/justbrowsing/justbrowsing-syslinux"
license=('custom')
depends=()
optdepends=('justbrowsing-archiso: boot files for LiveCD')
options=('!strip')
groups=("justbrowsing")
source=("https://github.com/justbrowsing/${pkgname}/archive/master.tar.gz")
install="jb-syslinux.install"
md5sums=('7918da478de127ccb7e33ef09c265658')
 
package() {
  cd "$srcdir/${pkgname}-master"

  # Store directory
  syslinux="livecd/arch/boot/syslinux"
  mkdir -p $pkgdir/${syslinux}

  # Boot files
  install -m644 c32/* $pkgdir/${syslinux}/
  install -m644 cfg/* $pkgdir/${syslinux}/
  install -m644 etc/* $pkgdir/${syslinux}/

  # Hardware Detect Tool
  mkdir -p $pkgdir/$syslinux/hdt
  install -m644 hdt/* $pkgdir/${syslinux}/hdt

  # Keymaps
  mkdir -p $pkgdir/${syslinux}/kbdmap/azerty/{n,u}
  mkdir -p $pkgdir/${syslinux}/kbdmap/dvorak/{n,u}
  mkdir -p $pkgdir/${syslinux}/kbdmap/qwerty/{n,u}
  mkdir -p $pkgdir/${syslinux}/kbdmap/qwertz/{n,u}
  install -m644 kbdmap/*.cfg $pkgdir/${syslinux}/kbdmap/
  install -m644 kbdmap/azerty/n/* $pkgdir/${syslinux}/kbdmap/azerty/n/
  install -m644 kbdmap/azerty/u/* $pkgdir/${syslinux}/kbdmap/azerty/u/
  install -m644 kbdmap/dvorak/n/* $pkgdir/${syslinux}/kbdmap/dvorak/n/
  install -m644 kbdmap/dvorak/u/* $pkgdir/${syslinux}/kbdmap/dvorak/u/
  install -m644 kbdmap/qwerty/n/* $pkgdir/${syslinux}/kbdmap/qwerty/n/
  install -m644 kbdmap/qwerty/u/* $pkgdir/${syslinux}/kbdmap/qwerty/u/
  install -m644 kbdmap/qwertz/n/* $pkgdir/${syslinux}/kbdmap/qwertz/n/
  install -m644 kbdmap/qwertz/u/* $pkgdir/${syslinux}/kbdmap/qwertz/u/
}
