# Maintainer: Corey Mwamba <contact.me@coreymwamba.co.uk>
pkgname=estonta-git
_pkgname=estonta
pkgver=r30.4b6fbd5
pkgrel=1
pkgbase=estonta-git
pkgdesc="A simple Bash and Yad-based appointment system."
arch=('i686' 'x86_64')
url="https://github.com/coreymwamba/estonta"
license=('GPL')
optdepends=('yad:	graphical interface for aldonos')
makedepends=('git')
source=('git://github.com/coreymwamba/estonta')
install='estonta-git.install'
md5sums=('SKIP')
pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
package(){
mkdir -p $pkgdir/usr/bin
mkdir -p $pkgdir/etc
  cd "$_pkgname"
install -p -D aldonos -m 0755 $pkgdir/usr/bin/aldonos
install -p -D lerta -m 0755 $pkgdir/usr/bin/lerta
install -p -D estonta.conf -m 0644 $pkgdir/etc/estonta.conf
}
