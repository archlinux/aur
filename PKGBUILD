# Maintainer: twa022 <twa022 at gmail dot com>

pkgname=thunar-vcs-plugin
pkgver=0.2.0
pkgrel=1
pkgdesc="SVN and GIT integration for Thunar."
arch=('i686' 'x86_64')
license=('GPL')
url="https://goodies.xfce.org/projects/thunar-plugins/thunar-vcs-plugin"
depends=('thunar>=1.7.0' 'git' 'subversion')
makedepends=('intltool')
source=("https://archive.xfce.org/src/thunar-plugins/${pkgname}/${pkgver%.*}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('SKIP')

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib/xfce4
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR=$pkgdir install
}
