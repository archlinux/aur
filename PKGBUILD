# Maintainer: Denis Benato <benato.denis96@gmail.org>

_pkgname=login_ng
pkgname=$_pkgname-bin
pkgver=0.6.2
pkgrel=1
pkgdesc='A greeter with addition functionalities'
url="https://github.com/neroreflex/$_pkgname"
license=()
makedepends=(
    'cargo'
    'clang'
)
depends=(
    'pam'
    'dbus'
    'greetd'
    'seatd'
)
arch=('i686' 'x86_64' 'armv7h')
source=(
    "$_pkgname-${pkgver}.tar.bz2::$url/releases/download/${pkgver}/$_pkgname.bin.tar.bz2"
)
sha256sums=(
    'df63dba185d1ef6ba5336e523ea4744d5b14cfea1e031b1df8d716f97391ddfa' # login-ng-${pkgver}.tar.gz
)
backup=(
    etc/login_ng-session/default.service
    etc/login_ng-session/steamdeck.service
    etc/pam.d/login_ng
    etc/pam.d/login_ng-autologin
    etc/pam.d/login_ng-ctl
)

package() {
    cp -a "$srcdir"/* "$pkgdir"
}
