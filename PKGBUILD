# Maintainer: aksr <aksr at t-com dot me>
pkgname=ttf-crimson-pro-git
pkgver=r233.f1f686d
pkgrel=1
pkgdesc='The Crimson Text typeface'
arch=('any')
url='https://github.com/Fonthausen/CrimsonPro'
license=('OFL')
depends=('fontconfig' 'xorg-font-utils')
source=("$pkgname::git+https://github.com/Fonthausen/CrimsonPro")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"
  install -D -m644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname/OFL.txt"
  mkdir -p "$pkgdir/usr/share/fonts/TTF/"
  cd fonts/ttfs
  install -m644 CrimsonPro*.ttf "$pkgdir/usr/share/fonts/TTF/"
}

