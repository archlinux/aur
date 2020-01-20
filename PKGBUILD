# Maintainer: Michael Serajnik <ms dot mserajnik dot at>
pkgname=ttf-jetbrains-mono-powerline-git
_pkgname=JetBrainsMono-Powerline
pkgver=r3.526af06
pkgrel=1
pkgdesc="JetBrains Mono for Powerline"
arch=('any')
url="https://github.com/seanghay/$_pkgname"
license=('Apache-2.0')
source=("git+https://github.com/seanghay/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_pkgname"
  install -d "$pkgdir/usr/share/fonts/${pkgname}"
  install -t "$pkgdir/usr/share/fonts/${pkgname}" -m644 ./*.ttf
}
