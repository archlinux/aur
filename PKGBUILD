# Maintainer :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)
# Contributor : Sergej Pupykin <arch+pub@sergej.pp.ru>
# Contributor : ajs124 < aur AT ajs124 DOT de >


_pkgname=firejail
pkgname="$_pkgname-no-apparmor"

pkgver=0.9.70
pkgrel=1

pkgdesc='Linux namespaces sandbox program, compiled without dependency to apparmor'
arch=('x86_64')
license=('GPL2')
url="https://github.com/netblue30/$_pkgname"

provides=("$_pkgname")
conflicts=("$_pkgname")

optdepends=('python: needed to execute some of the included contrib scripts')

changelog=RELNOTES
backup=("etc/$_pkgname/login.users"
		"etc/$_pkgname/$_pkgname.config")
#source=($_pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
source=("https://sourceforge.net/projects/$_pkgname/files/$_pkgname/$_pkgname-$pkgver.tar.xz"{,.asc})
sha256sums=('b77b67a4db7c01d69cb033a50aa7b1132dfaeb2cd97ce6412285235265b71b17' 'SKIP')
validpgpkeys=('F951164995F5C4006A73411E2CCB36ADFC5849A7')


build() {
  cd "$_pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
