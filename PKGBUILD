# Maintainer: ObserverOfTime <chronobserver@disroot.org> 
pkgname=hack-font-ligature-nerd-font-git
pkgver=r2.d7b312f
pkgrel=1
pkgdesc='Nerd font patched Hack font with ligatures'
arch=('any')
url='https://github.com/pyrho/hack-font-ligature-nerd-font'
license=('MIT')
makedepends=('git')
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/${pkgname%-git}
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -dm0755 ${pkgdir}/usr/share/fonts/TTF
  install -Dm0644 ${srcdir}/${pkgname%-git}/font/*.ttf ${pkgdir}/usr/share/fonts/TTF
}

