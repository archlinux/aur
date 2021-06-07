# Maintainer: loathingkernel <loathingkernel a_ gmail d_ com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=wine-mono-bin
pkgver=6.2.0
pkgrel=1
pkgdesc="Wine's built-in replacement for Microsoft's .NET Framework"
arch=('any')
url="https://wiki.winehq.org/Mono"
license=('GPL' 'LGPL2.1' 'MPL')
depends=('wine')
provides=("${pkgname/-bin/}=$pkgver")
options=('!strip')
source=("https://github.com/madewokherd/wine-mono/releases/download/${pkgname/-bin/}-$pkgver/${pkgname/-bin/}-$pkgver-x86.tar.xz")

package() {
  install -Dm 755 -d "$pkgdir"/usr/share/wine/mono/
  cp -dr --no-preserve='ownership' ${pkgname/-bin/}-$pkgver "$pkgdir"/usr/share/wine/mono/
}

sha512sums=('7e5ed7e4abf88d915d59715b107722135af08bb43e6356f9ae95fdafc539332150a82f85b67d15710ae4ece6c883733bab142f59894f70acd893cac85f6ca905')
