# Maintainer: André <andre-aur@delorus.de>
pkgname=gomopho
_realname=GoMoPho
pkgver=3.1
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
sha256sums=('45366ad405b7b0ea91962377cb444ff9f09373f06d9ea8a0fed787391a720a12')

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
