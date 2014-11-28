# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=flactagger
pkgver=3.1.1
pkgrel=1
pkgdesc="A Ruby script for tagging FLAC files"
arch=('any')
url="http://flactagger.berlios.de/"
license=('GPL3')
depends=('ruby' 'flac')
source=(http://download.berlios.de/$pkgname/$pkgname-$pkgver.tar.bz2)

md5sums=('72282bb6b0b7a29249f9193795cd6d6e')

build() {
  cd ${srcdir}/$pkgname-$pkgver

  ruby setup.rb config || return 1
  ruby setup.rb setup || return 1
  ruby setup.rb install --prefix=${pkgdir} || return 1
}
