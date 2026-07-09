# Maintainer: sanlun <miwa at nc hyphen toyama dot ac dot jp>

pkgname=stumpwm-pamixer-git
__pkgname=${pkgname%-git}
_pkgname=${__pkgname#stumpwm-}
pkgver=r21.5ea5e7a
pkgrel=1
pkgdesc="Minimalistic Pulseaudio volume and microphone control module for StumpWM"
arch=('any')
url='https://github.com/Junker/stumpwm-pamixer'
license=('GPL-3.0-only')
depends=('stumpwm' 'pamixer')
makedepends=('git')
provides=("$__pkgname")
conflicts=("$__pkgname")
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$__pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package(){
  cd "$__pkgname"
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  install -Dm644 -t "$pkgdir/usr/share/stumpwm/contrib/$_pkgname" *.{lisp,asd}
}
