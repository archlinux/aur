# Maintainer: aksr <aksr at t-com dot me>
pkgname=otf-libertinus-git
pkgver=r252.ee27ebc
pkgrel=1
epoch=
pkgdesc="Libertinus font family"
arch=('any')
url="https://github.com/khaledhosny/libertinus"
license=('custom:OFL' 'GPL')
groups=()
depends=('fontconfig' 'xorg-font-utils')
makedepends=('git')
optdepends=()
checkdepends=()
provides=()
conflicts=('otf-libertinus')
replaces=('otf-libertinus')
backup=()
options=()
changelog=
install=otf.install
source=("$pkgname::git+https://github.com/khaledhosny/libertinus.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"
  for i in *.otf; do
    install -Dm644 $i $pkgdir/usr/share/fonts/OTF/$i
  done
  install -Dm644 OFL.txt $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}

