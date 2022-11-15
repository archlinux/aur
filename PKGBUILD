# Maintainer: Erwann Lagouche <popgthyrd@gmail.com>
pkgname=highflux-preview-bin
pkgver=0.2.4
pkgrel=1
epoch=
pkgdesc='Highflux preview version'
arch=('any')
url='https://www.highflux.io/'
license=('copyright')
groups=()
depends=('wget')
makedepends=()
checkdepends=()
conflicts=('highflux' 'hf')
replaces=()
backup=()
option=()
install=
changelog=
source=()
noextract=()
md5sum=()
validpkgkeys=()

prepare() {
  wget 'https://www.highflux.io/ping/dl_redirect/linux_tgz' -O "./$pkgname-$pkgver.tar.gz"
}

package() {
  tar -xf "./$pkgname-$pkgver.tar.gz"
	mkdir -p "$pkgdir/usr/bin" 
  cp "./highflux-$pkgver/hf" "$pkgdir/usr/bin/hf"
  cp "./highflux-$pkgver/highflux" "$pkgdir/usr/bin/highflux"
	mkdir -p "$pkgdir/usr/share/applications"
  cp "../entry.desktop" "$pkgdir/usr/share/applications/highflux.desktop"
}
