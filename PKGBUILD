# Maintainer: Michele Sorcinelli <michelesr@autistici.org>
pkgname=nvidia-xrun-pm
pkgver=0.3.2
pkgrel=3
epoch=
pkgdesc='Alternative version of nvidia-xrun, that relies on kernel PM instead of bbswitch'
arch=('x86_64')
url='https://github.com/michelesr/nvidia-xrun-pm'
license=('GPL')
groups=()
depends=('xorg-server' 'xorg-xinit' 'xorg-xrandr' 'NVIDIA-MODULE' 'mesa-libgl')
makedepends=()
checkdepends=()
optdepends=()
provides=('nvidia-xrun')
conflicts=('nvidia-xrun')
replaces=()
backup=()
options=()
install=$pkgname.install
changelog=
source=("https://github.com/michelesr/nvidia-xrun/archive/${pkgver}.tar.gz")
noextract=()
md5sums=('8b10b62038d6ea3ac7e10dff90056c95')
validpgpkeys=()

package() {
  cd "nvidia-xrun-${pkgver}"
  install -Dm 644 nvidia-xorg.conf "$pkgdir/etc/X11/nvidia-xorg.conf"
  install -Dm 644 nvidia-xinitrc "$pkgdir/etc/X11/xinit/nvidia-xinitrc"
  install -Dm 644 config/nvidia-xrun "$pkgdir/etc/default/nvidia-xrun"
  install -Dm 755 nvidia-xrun "$pkgdir/usr/bin/nvidia-xrun"
  install -Dm 644 nvidia-xrun-pm.service "$pkgdir/etc/systemd/system/nvidia-xrun-pm.service"
  install -dm 555 "$pkgdir/etc/X11/xinit/nvidia-xinitrc.d"
  install -dm 555 "$pkgdir/etc/X11/nvidia-xorg.conf.d"
}
