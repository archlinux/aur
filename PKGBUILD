# Maintainer: Julius Elias <JuliusE89@gmail.com>
pkgname=purple-gnome-keyring
pkgver=0.8
pkgrel=4
pkgdesc="Purple (Pidgin / Finch) plugin for Gnome-Keyring integration"
arch=(i686 x86_64)
url="https://github.com/GRBurst/purple-gnome-keyring/"
license=("GPLv3")
depends=(libsecret libpurple gnome-keyring)
install=$pkgname.install
source=(https://github.com/GRBurst/$pkgname/archive/v${pkgver}.${pkgrel}.tar.gz)
md5sums=('f989646561b357bb6339385d490ecd41')
sha1sums=('9e0ce7bf8dcf81088e8313bb329db6134b55ddf8')
sha512sums=('9a84ecb77d0335d4acce0fd70d72511eaf7b962ab797d955afa916982d4f20b4b32e349f7e505b655cca150c1237c2549c5b8cbc69e53d217a30ce5eec82a22b')

build() {
  cd $srcdir/$pkgname-$pkgver.${pkgrel}
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver.${pkgrel}
  mkdir -p $pkgdir/usr/lib/purple-2
  install -Dm655 $pkgname.so $pkgdir/usr/lib/purple-2
}
