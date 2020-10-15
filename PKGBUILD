# Maintainer: Victor Perevozchikov webmaster@victor3d.com.br
pkgname=highsierra-backgrounds-git
pkgver=r2.eab72df
pkgrel=1
pkgdesc='OS X High Sierra Backgrounds'
arch=('any')
url="https://github.com/victor3dptz/backgrounds"
license=('MIT')
makedepends=('git')
source=('git+https://github.com/victor3dptz/backgrounds')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/backgrounds"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  mkdir -p ${pkgdir}/usr/share/backgrounds
  cp -r "${srcdir}/backgrounds/highsierra/" "$pkgdir/usr/share/backgrounds/highsierra"
}
