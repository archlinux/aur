# Maintainer: Roshless <aur@roshless.com>
_appname_=etc-update
pkgname=${_appname_}-nogithub
pkgdesc="CLI to interactively merge .pacnew in /etc. I don't trust gentoo's github."
pkgver=2.3.60
pkgrel=1
arch=('x86_64') # according to (https://paste.roshless.me/WjYx)[this comment from etc-update comments]
url="https://wiki.gentoo.org/wiki/Handbook:X86/Portage/Tools#etc-update"
license=('GPL')
depends=('bash')
makedepends=('git')
provides=("${_appname_}")
conflicts=("${_appname_}")
source=("https://gitweb.gentoo.org/proj/portage.git/snapshot/portage-${pkgver}.tar.gz")
md5sums=('f8a83d38296f26c697559fb8afa7d457')

package() {
  install -Dm 0755 "portage-${pkgver}/bin/${_appname_}" "$pkgdir/usr/bin/${_appname_}"
  install -Dm 0644 "portage-${pkgver}/cnf/${_appname_}.conf" "$pkgdir/etc/${_appname_}.conf"
}

