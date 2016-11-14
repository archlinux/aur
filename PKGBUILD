# Maintainer: Storm Dragon <stormdragon2976@gmail.com>
_pkgname="GnuSocialShell"
pkgname="gnusocialshell-git"
pkgver=0.2
pkgrel=2
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

# Needs a pkgver function but none of the ones I try work, there are no tags and the tagless code only generates a . which causes an error.

build()
{
  cd "$_pkgname"
  touch config.rpath
  autoreconf -iv
  ./configure --prefix=/usr/local
  make
}

package()
{
  cd "$_pkgname"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
