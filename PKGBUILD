# Maintainer: Michael Arthur Long <adhaxclient at hotmail dot com>

_pkgname=ssh-rdp
pkgname=${_pkgname}-host-git
pkgver=r100.fd0db21
pkgrel=1
pkgdesc='Udev rules and dependencies for an ssh-rdp host'
arch=('any')
url='https://github.com/kokoko3k/ssh-rdp'
license=('LGPL3')
depends=('bash' 'ffmpeg' 'openssh' 'netevent-git' 'xorg-xdpyinfo' 'pulseaudio')
optdepends=('ssh-rdp-git: bash script used on clients to connect')
provides=('ssh-rdp-host')
conflicts=('ssh-rdp-host')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -Dm644 "$srcdir/$_pkgname/70-uinput.rules" "$pkgdir/etc/udev/rules.d/70-ssh-rdp-uinput.rules"
}
