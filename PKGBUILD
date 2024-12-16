# Maintainer: Storm Dragon <storm_dragon@stormux.org>
_pkgname=rpi-clone
pkgname=rpi-clone-git
pkgver=47.82b833c
pkgrel=1
pkgdesc="A raspberry Pi backup utility that uses rsync"
arch=('any')
url="https://github.com/billw2/rpi-clone"
license=('UNKNOWN')
depends=('bsdmainutils' 'dosfstools' 'parted' 'rsync' 'util-linux')
makedepends=('git')
provides=("$_pkgname" "${_pkgname}-setup")
conflicts=("$_pkgname" "${_pkgname}-setup")
source=("$_pkgname::git+https://github.com/billw2/$_pkgname.git")
md5sums=("SKIP")

 pkgver()
{
   cd "$srcdir/$_pkgname"
   echo "$(git rev-list --count HEAD).$(git describe --always)"
 }

 package()
 {
  cd "$_pkgname"
  install -Dm755 "${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
  install -Dm755 "${_pkgname}-setup" "$pkgdir/usr/bin/${_pkgname}-setup"
  }

# vim:set ts=2 sw=2 et:
