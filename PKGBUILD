# Mantainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=shorten
pkgver=3.6.1
pkgrel=2
pkgdesc="An established low complexity waveform coder which uses a lossless compression scheme, superior to that of mp3"
arch=('i686' 'x86_64')
url="http://www.etree.org/shnutils/shorten/"
license=('custom')
source=(http://www.etree.org/shnutils/$pkgname/dist/src/$pkgname-$pkgver.tar.gz)
md5sums=('fb59c16fcedc4f4865d277f6e45866a7')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  make prefix="${pkgdir}"/usr install

#license
  install -D -m644 COPYING "${pkgdir}"/usr/share/licenses/$pkgname/COPYING
}
