# Maintainer: Michael Arthur Long <adhaxclient at hotmail dot com>

_pkgname=ssh-rdp
pkgname=${_pkgname}-git
pkgver=r113.cb74075
pkgrel=1
pkgdesc="Real display ssh based remote desktop. No relation to Microsoft's remote desktop protocol."
arch=('any')
url='https://github.com/kokoko3k/ssh-rdp'
license=('LGPL3')
depends=('bash' 'ffmpeg' 'openssh' 'netevent-git' 'wmctrl' 'mpv' 'util-linux')
makedepends=('git')
optdepends=('ssh-rdp-host-git: udev rules and dependencies for the host')
provides=('ssh-rdp')
conflicts=('ssh-rdp')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -Dm755 "$srcdir/$_pkgname/ssh-rdp.sh" "$pkgdir/usr/bin/ssh-rdp.sh"
}
