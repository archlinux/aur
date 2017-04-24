# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>

pkgname=diablorl-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="A roguelike game based on Blizzard's Diablo game"
arch=(i686 x86_64)
url="https://diablo.chaosforge.org/"
license=("GPL2")
depends=('bash' 'glibc' 'libx11')
source=("diablorl")
source_i686=("https://diablo.chaosforge.org/file_download/12/diablorl-linux-i386-050.tar.gz")
source_x86_64=("https://diablo.chaosforge.org/file_download/13/diablorl-linux-x64-050.tar.gz")
md5sums=('4b9d8d61586116dfd8348d89c603bcca')
md5sums_i686=('eb1e0ceefd73af6eac8de8d7b4429f2a')
md5sums_x86_64=('894dc2324f16d2b9879c241472105531')
install=$pkgname.install

package() {
  mkdir -p "$pkgdir/opt/diablorl"
  if [[ "$CARCH" == "x86_64" ]]; then
    cp diablorl-linux-x64-050/* "$pkgdir/opt/diablorl"
  fi
  if [[ "$CARCH" == "i686" ]]; then
    cp diablorl-linux-i386-050/* "$pkgdir/opt/diablorl"
  fi
  install -Dm755 "$srcdir/diablorl" "$pkgdir/usr/bin/diablorl"
}
