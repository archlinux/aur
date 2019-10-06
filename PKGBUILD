# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Peter Semiletov <peter.semiletov@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Roman Kyrylych <roman@archlinux.org>
# Contributor: Michal Kaliszka <desmont@gmail.com>
# Contributor: Zsolt Varadi <sysop_xxl@fibermail.hu>
# Contributor: Holger Rauch < holger dot rauch at posteo dot de >

pkgname=tea-qt
pkgver=48.0.1
pkgrel=1
pkgdesc="Powerful text editor for Linux and *BSD."
arch=('x86_64')
url="http://semiletov.org/tea/"
license=('GPL')
depends=('qt5-base' 'qt5-declarative' 'gcc-libs' 'aspell' 'hunspell')
source=(https://github.com/psemiletov/tea-qt/archive/$pkgver.tar.gz)
md5sums=(2637cbd126d97ae491ce2375074ca691)

build() {
  cd "${srcdir}/tea-qt-${pkgver}"
  export LANG="en_US.UTF-8"
  export LC_ALL="en_US.UTF-8"
  qmake-qt5
  make
}

package(){
  cd "${srcdir}/tea-qt-${pkgver}"
  export LANG="en_US.UTF-8"
  export LC_ALL="en_US.UTF-8"
  make INSTALL_ROOT="${pkgdir}" install
}
