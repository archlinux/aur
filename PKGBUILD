# Maintainer: loathingkernel <loathingkernel a_ gmail d_ com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=wine-mono-bin
pkgver=5.0.1
pkgrel=1
pkgdesc="Wine's built-in replacement for Microsoft's .NET Framework"
arch=('any')
url="https://wiki.winehq.org/Mono"
license=('GPL' 'LGPL2.1' 'MPL')
depends=('wine')
provides=("${pkgname/-bin/}=$pkgver")
options=('!strip')
source=("https://github.com/madewokherd/wine-mono/releases/download/${pkgname/-bin/}-$pkgver/${pkgname/-bin/}-$pkgver-x86.tar.xz")
sha512sums=('758c407cdfa35c0e863681f83183a965a0eda060be59ae84e5d51b1732372843002a99e6a854903d93545b681b67fedb51505c0f0deb4315ab7964a2d65c2757')

package() {
  install -Dm 755 -d "$pkgdir"/usr/share/wine/mono/
  cp -dr --no-preserve='ownership' ${pkgname/-bin/}-$pkgver "$pkgdir"/usr/share/wine/mono/
}
