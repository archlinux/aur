# Maintainer: aksr <aksr at t-com dot me>
pkgname=gsfonts-type1-git
pkgver=r11.91edd6e
pkgrel=1
epoch=
pkgdesc="URW+ Postscript core35 Type 1 Format fonts"
arch=('any')
url="http://git.ghostscript.com/?p=urw-core35-fonts.git;a=summary"
license=('AGPL3')
groups=()
depends=('xorg-font-utils' 'fontconfig')
makedepends=('git')
optdepends=()
checkdepends=()
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+git://git.ghostscript.com/urw-core35-fonts.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"
  mkdir -p "$pkgdir"/usr/share/fonts/Type1
  #install -m644 *.{pfb,pfm,afm,t1} "$pkgdir"/usr/share/fonts/Type1
  install -m644 *.{afm,t1} "$pkgdir"/usr/share/fonts/Type1
}

