# Maintainer: ForumPlayer <fp@forumplayer.dev>

pkgname=speedtest
pkgver=1.1.1.28
pkgrel=1
pkgdesc="Official Ookla Speedtest CLI for personal, non-commercial use"
arch=('x86_64')
license=('custom')
url="https://www.speedtest.net/"
makedepends=('wget' 'tar' 'binutils')
depends=('ca-certificates')
conflicts=("speedtest-cli")
sha256sums=('0a957d6cfc1915e143d1a11f9fb05d52d9015f0b196e52e6093af5e53bee446c')

srcver=1.1.1.28-1.c732eb82cf
source=("https://packagecloud.io/ookla/speedtest-cli/packages/debian/bullseye/speedtest_"$srcver"_amd64.deb/download.deb")

build() {
  cd $srcdir
  mkdir -p data
  cd data
  tar -xvf ../data.tar.gz
}

package() {
  cp -arv "$srcdir/data/." "$pkgdir/"
}
