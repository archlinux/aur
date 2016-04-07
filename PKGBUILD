# Maintainer: mwberry <null [at] example [dot] com>
pkgname=rtorrent-systemd
pkgver=0.1
pkgrel=1
pkgdesc="systemd integration for rtorrent"
url="https://wiki.archlinux.org/index.php/User:Mwberry/rtorrent-systemd"
arch=('any')
license=('GPL2')
depends=('rtorrent' 'screen' 'bash' 'coreutils')
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
install=''
source=()
md5sums=()

# No build step because all sources are shell scripts

package() {
  
  mkdir -p "${pkgdir}/usr/lib/systemd/system"
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/etc/rtorrent.d"

  cp -a "${pkgdir}/../../rtorrent@.service" "${pkgdir}/usr/lib/systemd/system"
  cp -a "${pkgdir}/../../rtorrentctl"       "${pkgdir}/usr/bin"
  # There is nothing to copy into the /etc branch,
  # we just want it to be present for end-users to
  # populate with system-specific configuration

  # Correct ownership
  chown -R root:root "${pkgdir}/usr"
  chown -R root:root "${pkgdir}/etc"
}

# vim:set ts=2 sw=2 et:
