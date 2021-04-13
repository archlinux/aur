# Maintainer: loathingkernel <loathingkernel a_ gmail d_ com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=wine-mono-bin
pkgver=6.1.1
pkgrel=2
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

sha512sums=('ecc2ab6875fffebc5e94c23fd04c84ce5550be65a7f5f1832d4c74a944680405c4cba28a59b7c362abb08d689e83f153543eb0ef375ec9b894295aba1eff99b1')
