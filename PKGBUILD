# Maintainer: Fatih Bostancı <ironic@yaani.com>

pkgname=ezanvakti
pkgver=7.6
pkgrel=1
pkgdesc="Islamic Prayer Times bash script for Turkish users"
arch=('any')
url="https://gitlab.com/fbostanci/ezanvakti"
license=('GPL3')
provides=("ezanvakti=$pkgver")
conflicts=('ezanvakti-git')
# change curl to wget and ffmpeg to mplayer if wanted
# isteniyorsa curl yerine wget, ffmpeg yerine mplayer yazilabilir.
depends=('bash' 'yad' 'sed' 'gawk' 'grep' 'hicolor-icon-theme' 'libnotify' 'curl' 'ffmpeg')
optdepends=('bash-completion: completion for bash')
source=("https://gitlab.com/fbostanci/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha512sums=('b7402ee5286348e8d840166b98f7b54c595e3012fad842b383101f6b70ff66f6637308c76f49e79cfedaf5e7102e20a391f4cb90ae7c8fe15e80928c60be2b00')

package() {
  cd "$pkgname-v$pkgver"
  make PREFIX=/usr sysconfdir=/etc DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
