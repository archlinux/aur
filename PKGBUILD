pkgname='numix-cinnamon-transparent-git'
pkgver=r76.a80c226
pkgrel=1
pkgdesc="A Numix Theme for cinnamon; transparent and compact version "
arch=('any')
url='https://github.com/edoz90/numix-cinnamon-transparent'
license=('AGPL3')
source=("$pkgname::git+https://github.com/edoz90/numix-cinnamon-transparent.git#commit=2ed7bd7c24d88b348712d4a72e0059570410b563")
md5sums=('SKIP')
depends=('cinnamon')
makedepends=('git')

pkgver() {
  cd "$pkgname"
  (set -o pipefail
   git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)")
}

package() {
    install -dm755 "$pkgdir/usr/share/themes"
    cp -R "$pkgname/Numix-Cinnamon-Transparent" "$pkgdir/usr/share/themes/"
}
