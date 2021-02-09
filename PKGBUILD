# Maintainer: Carson Rueter <roachh at proton mail dot com>

pkgname='discord-qt'
_pkgname='DiscordQt'
pkgdesc='Discord client powered by Node.JS and Qt Widgets.'
url='https://github.com/ruslang02/discord-qt'
license=('GPL')
pkgver=0.5.1
pkgrel=1
source=("https://github.com/ruslang02/discord-qt/releases/download/v$pkgver/$_pkgname-v$pkgver-linux-x64.deb")
md5sums=('8b669be40a1998a58cdb3a184bd31ea4')
provides=('discord-qt')
depends=('qt5-base' 'qt5-svg' 'libbsd' 'libgcrypt' 'lzo')
arch=('x86_64')

package() {
  cd "$srcdir"
  ar x "$_pkgname-v$pkgver-linux-x64.deb"
  tar xJf data.tar.xz

  cd "usr/lib/discord-qt/lib"
  cp libicu* libpcre* -t ../../
  cd ..
  rm -rf doc lib *.AppImage

  cd "$srcdir"
  cp -r "usr" "$pkgdir"
}
