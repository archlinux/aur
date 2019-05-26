# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Roman Kyrylych <roman@archlinux.org>
# Contributor: Michal Kaliszka <desmont@gmail.com>
# Contributor: Zsolt Varadi <sysop_xxl@fibermail.hu>
# Contributor: Holger Rauch < holger dot rauch at posteo dot de >

pkgname=tea
pkgver=47.1.0
pkgrel=4
pkgdesc="A Qt-based text editor for Linux and *BSD. With an ultimate small size TEA provides you hundreds of functions."
arch=('x86_64')
url="http://semiletov.org/tea/"
license=('GPL')
depends=('qt5-base' 'qt5-declarative' 'gcc-libs' 'aspell' 'hunspell')
install=tea.install
DLAGENTS=("http::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")
source=(http://semiletov.org/tea/dloads/tea-$pkgver.tar.bz2)
sha256sums=('5fda8dc7b96ad0dcada1625e681b4d7b5794984e9736be394e17419470937e56')
sha512sums=('7787b2abd1355169519b16d78f3d479a2aea777400d113805c4151e3ce734d73b3d330c0b96512ccf8a9cd482b44fa22e61856491fa05daad1ce057abb89a332')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export LANG="en_US.UTF-8"
  export LC_ALL="en_US.UTF-8"
  qmake-qt5
  make
}

package(){
  cd "${srcdir}/${pkgname}-${pkgver}"
  export LANG="en_US.UTF-8"
  export LC_ALL="en_US.UTF-8"
  make INSTALL_ROOT="${pkgdir}" install
}
