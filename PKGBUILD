# Maintainer: Bruno Inec <brunoinec at gmail dot com> 

pkgname='wtfutil-git'
pkgver=r402.e266059
pkgrel=1
pkgdesc="Personal information dashboard for your terminal"
arch=('x86_64')
url="https://wtfutil.com"
license=('MIT')
makedepends=('go')
provides=('wtfutil')
conflicts=('wtfutil')
source_x86_64=("git://github.com/senorprogrammer/wtf.git")
sha256sums_x86_64=('SKIP')

pkgver() {
  cd "${srcdir}/wtf"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  GOPATH="${srcdir}" go get -v -u github.com/senorprogrammer/wtf
}

package(){
  install -D "${srcdir}/bin/wtf" "${pkgdir}/usr/bin/wtfutil"
}
