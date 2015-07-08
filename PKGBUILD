# Maintainer: justbrowsing <developer4linux+aur@gmail.com>
pkgname=justbrowsing-xorg
pkgver=1.1
pkgrel=1
pkgdesc="X11 Xorg config files for JustBrowsing"
arch=('any')
url="https://github.com/justbrowsing/justbrowsing-xorg"
license=('unknown')
depends=('xorg-xinit')
makedepends=('unzip')
optdepends=('justbrowsing-home: Home directory for JustBrowsing')
source=(https://github.com/justbrowsing/justbrowsing-xorg/archive/master.zip)
md5sums=('d2b722edad1a7f13def287e12b86b49c')

package() {
  cd "$srcdir/${pkgname}-master"
  mkdir -p "${pkgdir}/etc/X11/xorg.conf.d"
  install -Dm644 etc/X11/xorg.conf.d/10-disableVTs.conf.devmode "${pkgdir}/etc/X11/xorg.conf.d/"
  install -Dm644 etc/X11/xorg.conf.d/10-evdev.conf "${pkgdir}/etc/X11/xorg.conf.d/"
  install -Dm644 etc/X11/xorg.conf.d/10-mtrack.conf "${pkgdir}/etc/X11/xorg.conf.d/"
  install -Dm644 etc/X11/xorg.conf.d/10-quirks.conf "${pkgdir}/etc/X11/xorg.conf.d/"
  install -Dm644 etc/X11/xorg.conf.d/50-synaptics.conf "${pkgdir}/etc/X11/xorg.conf.d/"
  install -Dm644 etc/X11/Xwrapper.config "${pkgdir}/etc/X11/"
}
