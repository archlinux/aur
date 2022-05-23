# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Robert Knauer <robert@privatdemail.net>
# Contributor: Eric Forgeot http://anamnese.online.fr

pkgname=abcpp
pkgver=1.4.6
pkgrel=1
pkgdesc='A simple yet powerful preprocessor designed for, but not limited to, ABC music files'
url='http://abcplus.sourceforge.net'
license=(GPL)
source=("https://sourceforge.net/projects/abcplus/files/$pkgname/$pkgname-$pkgver.tar.gz")
arch=(i686 x86_64)
sha256sums=('05a9a7f81b35aff8f1b03ad0c41539508812ec1e52d2f584a180d3c12e35edc1')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  # program
  install -Dm755 abcpp -t "$pkgdir"/usr/bin
  # abc include files
  install -Dm644 *.abp -t "$pkgdir"/usr/share/$pkgname
  # documentation & examples
  install -Dm644 docs/* -t "$pkgdir"/usr/share/doc/$pkgname
  install -Dm644 examples/* -t "$pkgdir"/usr/share/doc/$pkgname/examples
}
