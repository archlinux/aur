# Maintainer: Emil Lundberg <emil@emlun.se>

pkgname='pass-notify-git'
pkgver=0.4.0
pkgrel=1
pkgdesc='password-store extension for output via desktop notifications'
arch=('any')
url='https://github.com/emlun/pass-notify/'
license=('GPL3')
depends=('bash' 'dmenu' 'libnotify' 'pass')
source=("git+https://github.com/emlun/pass-notify.git")
provides=("pass-notify=${pkgver}")
replaces=('pass-patched-passmenu-notify-git')
conflicts=('pass-patched-passmenu-notify-git' 'pass-notify')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/pass-notify/"
  git describe | sed 's/^v//' | sed 's/-/.r/;s/-/./g'
}

package() {
  cd "${srcdir}/pass-notify/"
  make DESTDIR="${pkgdir}" PREFIX="${pkgdir}/usr/bin" install
}
