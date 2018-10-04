# Maintainer: Roshless <aur@roshless.com>
_appname_=etc-update
pkgname=${_appname_}-nogithub
pkgdesc="CLI to interactively merge .pacnew in /etc. I don't trust gentoo's github."
pkgver=2.3.50
pkgrel=1
arch=('x86_64') # according to (https://paste.roshless.me/WjYx)[this comment from etc-update comments]
url="https://wiki.gentoo.org/wiki/Handbook:X86/Portage/Tools#etc-update"
license=('GPL')
depends=('bash')
makedepends=('git')
provides=("${_appname_}")
conflicts=("${_appname_}")
source=("https://gitweb.gentoo.org/proj/portage.git/snapshot/portage-${pkgver}.tar.gz")
md5sums=('3433879f464267494adf42d99833028c')

package() {
  install -Dm 0755 "portage-${pkgver}/bin/${_appname_}" "$pkgdir/usr/bin/${_appname_}"
  install -Dm 0644 "portage-${pkgver}/cnf/${_appname_}.conf" "$pkgdir/etc/${_appname_}.conf"
}

