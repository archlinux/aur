# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=falcond-profiles-git
pkgver=r20.0f87c74
pkgrel=4
pkgdesc="Profiles for Falcond"
arch=('any')
url="https://github.com/PikaOS-Linux/falcond-profiles"
license=('MIT')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/PikaOS-Linux/falcond-profiles.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "${pkgname%-git}"
  install -Dm644 usr/share/falcond/system.conf -t "$pkgdir/usr/share/falcond/"
  install -Dm644 usr/share/falcond/profiles/*.conf -t \
    "$pkgdir/usr/share/falcond/profiles/"
  install -Dm644 usr/share/falcond/profiles/handheld/*.conf -t \
    "$pkgdir/usr/share/falcond/profiles/handheld/"
  install -Dm644 usr/share/falcond/profiles/htpc/*.conf -t \
    "$pkgdir/usr/share/falcond/profiles/htpc/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
