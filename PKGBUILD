# Maintainer: Zach Callear <zach@callear.org>
# Contributor: André <andre-aur@delorus.de>
pkgname=gomopho
_realname=GoMoPho
pkgver=3.6
pkgrel=2
pkgdesc="Google motion photos video extractor (extract MP4 from MVIMG)"
arch=(x86_64)
url="https://github.com/cliveontoast/GoMoPho"
license=('GPL')
groups=()
depends=(openssl-1.1 icu69-bin)
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
sha256sums=('20effeee0228708b68dbcf354306e7b506482c5f6ce2900326131b19b3a263f2')

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
