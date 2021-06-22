# maintainer: libele <libele@disroot.org>

pkgname=libf2c
pkgver=34.3.4.6.32
_rpmver=34-3.4.6-32.el7
pkgrel=1
pkgdesc="A library which is needed to run Fortran 77 dynamically linked programs built by g77 3.4.x (CentOS 7)."
arch=('x86_64')
url="https://centos.pkgs.org/7/centos-x86_64/compat-libf2c-34-3.4.6-32.el7.x86_64.rpm.html"
license=("LGPL" "GPL2")
options=(!strip)
makedepends=('rpmextract')
source=("http://mirror.centos.org/centos/7/os/x86_64/Packages/compat-${pkgname}-${_rpmver}.x86_64.rpm")
md5sums=('98ff125a18fd917949bbe556b05f72a7')
noextract=("compat-${pkgname}-${_rpmver}.x86_64.rpm")

prepare() {
  cd "${srcdir}"
  rpmextract.sh "compat-${pkgname}-${_rpmver}.x86_64.rpm"
}

package() {
  cd "${srcdir}"
  mv usr "${pkgdir}"/usr
  cd "${pkgdir}"/usr
  mv lib64 lib
  cd share

  mv doc/compat-"${pkgname}"-34-3.4.6 doc/"${pkgname}"
}
