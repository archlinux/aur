# Maintainer: Alois Nespor <info@aloisnespor.info>
# Contributor: speps <speps dot aur dot archlinux dot org>

pkgname=rssguard
pkgver=2.4.0
pkgrel=1
pkgdesc="A simple (yet powerful) Qt5 feed reader."
arch=('i686' 'x86_64')
url="https://bitbucket.org/skunkos/rssguard"
license=('GPL3')
depends=('qt5-webkit')
makedepends=('cmake' 'qt5-tools')
optdepends=('mariadb: MySQL/MariaDB storage backend support')
provides=('rss-guard')
conflicts=('rss-guard' 'rssguard-git')
replaces=('rss-guard')
install="$pkgname.install"
source=("$url/downloads/$pkgname-$pkgver.tar.gz")

prepare() {
  cd $pkgname-$pkgver
  [ -d b ] || mkdir b
}

build() {
  cd $pkgname-$pkgver/b
  cmake ../ -DUSE_QT_5=ON -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=release
  make
}

package() {
  cd $pkgname-$pkgver/b
  make DESTDIR="$pkgdir/" install
}
sha256sums=('fe91fd7803bbaf9e5b895c7697e6b3dcc2558f0f93c36c9c11324c0a1fee9d5a')
sha256sums=('5b9f87185a1d5b4ebbbd6aa8ff49fe0b470f323e7465c1a7c364198f62ed877e')
