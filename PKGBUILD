# Maintainer: Michael Arthur Long <adhaxclient at hotmail dot com>

_pkgname=ssh-rdp
pkgname=${_pkgname}-host-git
pkgver=r113.cb74075
pkgrel=1
pkgdesc='Udev rules and dependencies for an ssh-rdp host'
arch=('any')
url='https://github.com/kokoko3k/ssh-rdp'
license=('LGPL3')
depends=('bash' 'ffmpeg' 'openssh' 'netevent-git' 'xorg-xdpyinfo' 'pulseaudio')
makedepends=('git')
optdepends=('ssh-rdp-git: bash script used on clients to connect')
provides=('ssh-rdp-host')
conflicts=('ssh-rdp-host')
install="${pkgname}.install"
source=("git+${url}.git"
	"${pkgname}.install")
sha512sums=('SKIP'
	    '43ee6d7d124d9b5f710470f62bbfba371975d88d022325d68dc6a33cdf047a9382a752d3972dca602cb77db052683c6a6f57db8cbfea46304f0dd531c38bfed4')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -Dm644 "$srcdir/$_pkgname/70-uinput.rules" "$pkgdir/etc/udev/rules.d/70-ssh-rdp-uinput.rules"
}
