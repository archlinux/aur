# Maintainer: André <andre-aur@delorus.de>
pkgname=gomopho
_realname=GoMoPho
pkgver=3.3
pkgrel=1
pkgdesc="Google motion photos video extractor (extract MP4 from MVIMG)"
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
sha256sums=('5272c95183495c7bae10835a0e1c740f6c8807ba25061f9b4cbafe79d1392f2c')

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
  ln -s ../../opt/"$pkgname"/"$_realname"CoreConsole "$pkgdir"/usr/bin/"$pkgname"
}
