# Maintainer: Charles Milette <charles.milette@gmail.com>

_gitname=GmailMessageTray
pkgname=gnome-shell-extension-gmail-message-tray-git
pkgver=r71.5a5980c
pkgrel=1
pkgdesc="Gmail Message Tray Gnome Shell Extension"
arch=('any')
url="https://github.com/shumingch/$_gitname"
license=('GPL2')
depends=('gnome-shell')
makedepends=('git')
install='gschemas.install'
source=("git+https://github.com/shumingch/$_gitname.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_gitname}/"

  for i in $(find -type f); do
    install -Dm 644 "$i" "${pkgdir}/usr/share/gnome-shell/extensions/GmailMessageTray@shuming0207.gmail.com/${i}"
  done
}
