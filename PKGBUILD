# Maintainer: Fatih Bostancı <ironic@yaani.com>

_pkgname=ezanvakti
pkgname=ezanvakti-git
pkgver=v7.6.r0.g40e168a
pkgrel=1
pkgdesc="Islamic Prayer Times bash script for Turkish users"
arch=('any')
url="https://gitlab.com/fbostanci/ezanvakti"
license=('GPL3')
provides=('ezanvakti=7.6')
conflicts=('ezanvakti')
# change curl to wget and ffmpeg to mplayer if wanted
# isteniyorsa curl yerine wget, ffmpeg yerine mplayer yazilabilir.
depends=('bash' 'yad' 'sed' 'gawk' 'grep' 'hicolor-icon-theme' 'libnotify' 'curl' 'ffmpeg')
optdepends=('bash-completion: completion for bash')
source=("git+https://github.com/fbostanci/${_pkgname}.git")
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$_pkgname"
  make PREFIX=/usr sysconfdir=/etc DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
