# Maintainer: Bryan Malyn <bim9262 at gmail dot com>

pkgname=ttf-roboto-flex-git
_pkgname=ttf-roboto-flex
pkgver=3.100.r8.g7dd9b0b48e
pkgrel=2
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
pkgdesc="Upgrades Roboto to become a more powerful typeface system"
makedepends=('git')
arch=('any')
conflicts=('ttf-roboto-flex')
url="https://github.com/googlefonts/roboto-flex"
license=('custom:OFL')
source=("$_pkgname::git+$url.git")
sha256sums=(SKIP)

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd $_pkgname

  install -Dm644 fonts/*.ttf "$pkgdir"/usr/share/fonts/TTF/RobotoFlex-VF.ttf
  install -Dt "$pkgdir"/usr/share/licenses/$pkgname -m644 OFL.txt
}
