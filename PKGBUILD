# Maintainer: Gustavo Coutinho de Souza <aur at onemoresuza dot mailer dot me>
pkgname='pass-xmenu-git'
pkgver=0.1.0.r0.g8549344
pkgrel=1
pkgdesc="A pass extension that provides an xmenu and autofill capabilities"
arch=('any')
url='https://github.com/onemoresuza/pass-xmenu'
license=('GPL3')
depends=('pass'
         'xdotool')
makedepends=('git')
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  make DESTDIR="${pkgdir}" install
}
