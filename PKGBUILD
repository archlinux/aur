# Maintainer: Mohammad AlSaleh <CE.Mohammad.AlSaleh@gmail.com>

pkgbase=saldl-git
pkgname=("$pkgbase")
pkgver=v25.5.ged58345
pkgrel=1
url="https://saldl.github.io"
pkgdesc="A CLI downloader optimized for speed and early preview, based on libcurl."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
license=('AGPL')
depends=('curl' 'libevent')
makedepends=('python' 'git' 'asciidoc')
source=($pkgbase::git://github.com/saldl/saldl.git)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgbase"
  saldl_ver="$(git describe --tags --long --dirty)"
  echo ${saldl_ver//-/.}
}

build() {
  cd "$srcdir/$pkgbase"
  ./waf configure --prefix="/usr"
  ./waf build
}

package_saldl-git() {
  cd "$srcdir/$pkgname"
  ./waf install --destdir="$pkgdir"
}
