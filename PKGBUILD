# Maintainer: André <andre-aur@delours.de>
pkgname=gomopho
_realname=GoMoPho
pkgver=2.0.4
pkgrel=1
pkgdesc="Google motion photos video extractor"
arch=(x86_64)
url="https://github.com/cliveontoast/GoMoPho"
license=('GPL')
groups=()
depends=()
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(staticlibs)
install=
changelog=
source=("https://github.com/cliveontoast/GoMoPho/releases/download/v"$pkgver"/"$_realname".GNULinux."$pkgver".zip")
noextract=()
md5sums=('ea17c73af691a1d0861a84e016b59f76')

build() {
  chmod a+x GoMoPhoCoreConsole 
  rm "$_realname".GNULinux."$pkgver".zip
  rm grant_perms.sh
  rm readme.txt
}

package() {
  install -d "$pkgdir"/opt/"$pkgname"
  cd "$srcdir"
  cp -ar --no-preserve=ownership . "$pkgdir"/opt/"$pkgname"/

  install -d "$pkgdir"/usr/bin
  ln -s "$pkgdir"/opt/"$pkgname"/"$_realname"CoreConsole "$pkgdir"/usr/bin/"$pkgname"
}
