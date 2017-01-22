# Maintainer: luke bonham <dada [at] archlinux [dot] info>

pkgname=awesome-freedesktop-git
pkgver=87.27da971
pkgrel=2
pkgdesc="Freedesktop.org menu and desktop icons support for Awesome WM"
arch=('any')
url="https://github.com/copycat-killer/awesome-freedesktop"
license=('GPL2')
depends=('awesome')
makedepends=('git')
provides=('awesome-freedesktop')
conflicts=('awesome-freedesktop')
source=("git://github.com/copycat-killer/awesome-freedesktop.git")
md5sums=('SKIP')

pkgver() {
  cd awesome-freedesktop
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  mv awesome-freedesktop freedesktop
  install -dm755 "$pkgdir/usr/share/awesome/lib/freedesktop"
  rm -rf freedesktop/{wiki,.git*,*.rockspec,*TEMPLATE*,*.png}
  cp -a freedesktop "$pkgdir/usr/share/awesome/lib/"
}
