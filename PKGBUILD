# Maintainer: Storm Dragon <stormdragon2976@gmail.com>
_pkgname="GnuSocialShell"
pkgname="gnusocialshell-git"
pkgver=.
pkgrel=1
pkgdesc="A simple useful text-based GnuSocial client to UNIX-like Operating Systems"
arch=('armv7h' 'i686' 'x86_64')
url="https://github.com/dalmemail/GnuSocialShell"
license=("GPL")
depends=("curl")
makedepends=("git")
provides=("gss")
conflicts=("gss")
source=("git+${url}.git")
md5sums=("SKIP")

pkgver()
{
  cd "$_pkgname"
  git shortlog | tail -n2 | tr -Cd "[:digit:].-"
}
 
build()
{
  cd "$_pkgname"
  make
}

package()
{
  cd "$_pkgname"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
