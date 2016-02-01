# Maintainer: Joakim Reinert <mail+aur@jreinert.com>

pkgname=autopass-git
pkgver=0.r52.dc87443
pkgrel=2
pkgdesc='a rofi frontend for pass'
arch=(any)
url='https://github.com/jreinert/autopass'
license=('MIT')
depends=(ruby pass rofi xdotool xorg-xwininfo libnotify xclip)
makedepends=(git)

source=("${pkgname}::git+https://github.com/jreinert/autopass.git")
sha512sums=(SKIP)
provides=('autopass')
conflicts=('autopass')
optdepends=('passed-git: batch editing of pass entries with sed')

pkgver() {
  cd "${pkgname}"
  printf '0.r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${pkgname}"
  install -d "$pkgdir/usr/bin"
  install -m755 autopass "$pkgdir/usr/bin/autopass"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
