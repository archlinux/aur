# Maintainer:  Vladimir LAVALLADE<erus.iluvatar+archlinux@gmail.com>
# Contributor: Rob McCathie <archaur at rmcc dot com dot au>
# Contributor: Renato Garcia <fgar.renato@gmail.com>
# Contributor: dale <dale@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Jorge Barroso <jorge.barroso.11 at gmail dot com>
pkgname=pinball
pkgver=0.3.20230219
pkgrel=1
pkgdesc="The Emilia Pinball Project strives to fulfil your needs for a great pinball game in Linux"
arch=('x86_64')
url="http://pinball.sourceforge.net/"
license=('GPL-2.0-or-later')
depends=('libglvnd' 'sdl2' 'sdl2_mixer' 'sdl2_image' 'libtool')
install=pinball.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/adoptware/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('c2d8ffb595536282a613c534cb53b80cb1aa6f55f40213d4152e3bb0d6899af8')
options=(libtool)

build() {
  cd "$pkgname-$pkgver"
  ./bootstrap
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="${pkgdir}" install
}
