# Maintainer: Victor Perevozchikov webmaster@victor3d.com.br
pkgname=victor3d-skel
pkgver=r123.b22d5b4d
pkgrel=1
pkgdesc='Arch Linux configs for installer script'
arch=('any')
url="https://github.com/victor3dptz/arch-install"
license=('MIT')
depends=('obmenu2-git' 'i3-scrot' 'oblogout' 'adeos-oblogout-git' 'bunsen-themes-git' 'nerd-fonts-hack')
makedepends=('git')
source=('git+https://github.com/victor3dptz/arch-install')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/arch-install"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  mkdir -p ${pkgdir}/etc
  cp -r "${srcdir}/arch-install/usr" "$pkgdir"
  cp -r "${srcdir}/arch-install/etc/skel" "$pkgdir/etc"
}
