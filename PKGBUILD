# Maintainer: Jerry Xiao <aur at mail.jerryxiao.cc>

_srcname=icsdroneng
pkgname=icsdrone
pkgver=0.29
pkgrel=1
pkgdesc="An interface between a chess server and a chess engine"
arch=('i686' 'x86_64' 'armv7l' 'aarch64')
url="https://sourceforge.net/projects/icsdrone/"
license=('BSD')
source=("https://master.dl.sourceforge.net/project/icsdrone/icsdroneng-0.29.tar.gz")
sha256sums=('33f4bfe07c15ae6c6e8c4756468630cec71008d4d12f62fc474461c4deed203a')

build() {
    cd "$_srcname-$pkgver"
    ./configure --prefix=/usr
    make
}

package() {
    cd "$_srcname-$pkgver"
    make DESTDIR="${pkgdir}" install
}
