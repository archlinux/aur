# Maintainer: Jerry Xiao <aur at mail.jerryxiao.cc>

_pkgbase=rdnstun
_srcname=rdnstun
pkgname=${_pkgbase}-git
pkgver=r23.e5cb910
pkgrel=1
pkgdesc="ICMP Path Faker"
arch=('x86_64')
url="https://github.com/yangfl/rdnstun"
license=('WTFPL')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
makedepends=("git")
source=(
  "${_srcname}::git+https://github.com/yangfl/rdnstun.git#branch=master"
)
md5sums=(
  'SKIP'
)

pkgver() {
  cd "$srcdir/${_srcname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${_srcname}"
  make
}

package() {
  cd "$srcdir/${_srcname}"
  install -Dt "${pkgdir}/usr/bin" -m 755 rdnstun
}
