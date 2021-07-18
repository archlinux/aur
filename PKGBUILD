# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Roman Kyrylych <roman@archlinux.org>
# Contributor: Michal Kaliszka <desmont@gmail.com>
# Contributor: Zsolt Varadi <sysop_xxl@fibermail.hu>
# Contributor: Holger Rauch < holger dot rauch at posteo dot de >

pkgname=tea
pkgver=60.4.0
pkgrel=1
pkgdesc="Powerful text editor for Linux, *BSD, Windows, OS/2, Mac and Haiku OS"
arch=(x86_64)
url="https://tea.ourproject.org/"
license=(GPL3)
depends=(qt6-base qt6-5compat hunspell)
makedepends=(cmake)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/psemiletov/tea-qt/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('d5903675c72280d502d79ee9c7da7e8861b66f486fe0abbfe4aad243be1bc9f1df6d3be83d618fc4b84519b16257b8e44ce5b0a13b3bbb48908e496c721d99a3')

prepare() {
  mkdir -p "${srcdir}/tea-qt-${pkgver}/build"
}

build() {
  cd "${srcdir}/tea-qt-${pkgver}/build"
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package(){
  cd "${srcdir}/tea-qt-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
}

