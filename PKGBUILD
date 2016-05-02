# Maintainer: hazard <oshazard+aur@gmail.com>
pkgname=wemux-restrict
pkgver=3.2.1
pkgrel=1
pkgdesc="Multi-user Tmux with whitelist support"
url="http://github.com/oshazard/wemux"
license=('MIT')
arch=('any')
makedepends=('git')
depends=('tmux' 'lsof' 'openssh')
provides=('wemux')
conflicts=('wemux' 'wemux-git')
install=$pkgname.install
backup=('etc/wemux/wemux.conf')
source=("https://github.com/oshazard/wemux/archive/master.tar.gz")
md5sums=('fc1b5c5f6ddd2b0c1a1ef5d28e6de342')

package() {
  cd "${srcdir}/wemux-master"

  # Install script
  mkdir -p "$pkgdir/usr/bin"
  install -m755 wemux "$pkgdir/usr/bin/wemux"

  # Install config file
  mkdir -p "$pkgdir/etc/wemux"
  install -Dm644 wemux.conf.example $pkgdir/etc/wemux/wemux.conf

  #install manpage
  mkdir -p "$pkgdir/usr/share/man/man1"
  install -Dm644 man/wemux.1 $pkgdir/usr/share/man/man1/wemux.1

  # Install license
  mkdir -p "$pkgdir/usr/share/licenses/wemux"
  install -m644 MIT-LICENSE ${pkgdir}/usr/share/licenses/wemux/LICENSE
}
