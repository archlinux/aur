_username=boinc-next
_reponame=boinc-app-api
_pkgbase=boinc-app-api
pkgname=${_pkgbase}
pkgdesc="API for communication with BOINC applcations."
pkgver=1.0
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/$_username/${_reponame/}"
license=('LGPL')
options=('!staticlibs')
_ref="#tag=${pkgver}"
source=("git+https://github.com/${_username}/${_reponame}${_ref}")
sha256sums=('SKIP')

build() {
  cd ${srcdir}/${_reponame}

  autoreconf -i
  ./configure --prefix=/usr
  make
}

package() {
  cd ${_reponame}

  make DESTDIR="${pkgdir}" install
}
