# Maintainer:
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Victor Häggqvist <aur@snilius.com>

_pkgname=lightdm-webkit-archsingle-theme
pkgname=$_pkgname-git
pkgver=0.1.0.r1.g83d828c
pkgrel=1
epoch=1
pkgdesc="Archlinux signeluser theme for LightDM Webkit"
arch=('i686' 'x86_64')
url="https://github.com/victorhaggqvist/lightdm-webkit-archsingle-theme"
license=("GPL2")
depends=('lightdm-webkit2-greeter')
makedepends=('git')
providers=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/victorhaggqvist/lightdm-webkit-archsingle-theme.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -dm755 "$pkgdir/usr/share/lightdm-webkit/themes/"
  cp -r "$srcdir/$_pkgname" "$pkgdir/usr/share/lightdm-webkit/themes/archsingle"
}
