# Maintainer: PiterDeVries <https://aur.archlinux.org/account/PiterDeVries>

pkgname=gsl-shell-bin
_pkgname=gsl-shell
pkgver=2.3.6
pkgrel=1
pkgdesc='GNU Scientific Library shell based on LuaJIT2'
url='https://franko.github.io/gsl-shell/'
license=('GPL-3.0-only')
depends=('gsl' 'agg' 'luajit' 'libx11' 'fox' 'freetype2' 'lapack' 'readline')
arch=('x86_64')
conflicts=('gsl-shell' 'gsl-shell-git')
provides=('gsl-shell')
source=("https://github.com/franko/${_pkgname}/releases/download/v${pkgver}/gsl-shell-linux-x86-64.tar.gz")
sha256sums=('9076f182f6e286056550e6a1b9adc5fd114f7e5d8bdcfc277c01f3a103f799e0')


package() {
  #create directories in the destination:
  install -d -m755 $pkgdir/usr
  install -d -m755 $pkgdir/usr/bin
  install -d -m755 $pkgdir/usr/share
  install -d -m755 $pkgdir/usr/share/applications
  install -d -m755 $pkgdir/usr/share/icons
  install -d -m755 $pkgdir/usr/share/icons/pixmaps
  
  #copy files from the binary (src) to the destination:
  cd "$srcdir/${_pkgname}"  
  cp ./bin/gsl-shell      $pkgdir/usr/bin
  cp ./bin/gsl-shell-gui  $pkgdir/usr/bin
  cp -r ./share/gsl-shell $pkgdir/usr/share
  cp ./gsl-shell.desktop  $pkgdir/usr/share/applications
  cp ./gsl-shell.svg      $pkgdir/usr/share/icons/pixmaps
}
