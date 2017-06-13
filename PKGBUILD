# Maintainer: Charles Milette <charles.milette@gmail.com>

_gitname=TOTP_Clipboard-guillaume.gauvr.it
pkgname=gnome-shell-extension-totp-cliboard-git
pkgver=r11.3c798d2
pkgrel=1
pkgdesc="Gnome Shell extension for TOTP"
arch=('any')
url="https://github.com/mardiros/$_gitname"
license=('unknown')
depends=('gnome-shell')
makedepends=('git')
install='gschemas.install'
source=("git+https://github.com/mardiros/$_gitname.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_gitname}/"

  for i in $(find -type f); do
    install -Dm 644 "$i" "${pkgdir}/usr/share/gnome-shell/extensions/TOTP_Clipboard@guillaume.gauvr.it/${i}"
  done
}
