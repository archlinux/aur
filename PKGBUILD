# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: mentallaxative <beshimi@hotmail.com>

pkgname=antiwm
pkgver=0.0.5
pkgrel=1
pkgdesc="A small and simple window manager inspired by Ratpoison"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/antiwm/"
license=('MIT')
depends=('libx11')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('455c79bf4379371bb5bba78553b64432')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  install -Dm755 $pkgname "${pkgdir}"/usr/bin/$pkgname
  install -Dm644 README "${pkgdir}"/usr/share/doc/$pkgname/README
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}
