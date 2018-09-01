# Maintainer: Naomi Phillips <naoph@cryptolab.net>
pkgname=upl-git
_pkgname=upl
pkgver=0.1.1.r0.g72dd077
pkgrel=1
epoch=1
pkgdesc="A tiny script for uploading files to webservers over SSH"
arch=('any')
url="https://github.com/naoph/upl"
license=('GPL')
provides=($_pkgname)
conflicts=($_pkgname)
depends=('python' 'python-yaml' 'openssh')
makedepends=('git')
source=("$pkgname::git+https://github.com/naoph/upl.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags --long | sed -r -e 's,^[^0-9]*,,;s,([^-]*-g),r\1,;s,[-_],.,g'
}

package() {
  cd $pkgname
  install -Dm755 "upl.py" "$pkgdir/usr/bin/upl"
}
