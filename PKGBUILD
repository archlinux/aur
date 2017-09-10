# Maintainer: Justin R. St-Amant <jstamant24 at gmail dot com>
pkgname=googlecl-git
pkgver=0.9.15
pkgrel=1
pkgdesc="Command line utility to use google services"
arch=('any')
url="https://github.com/vinitkumar/googlecl"
license=('APACHE')
depends=('python2'
		 'python2-oauth2client'
		 'python2-gdata'
		 'python2-httplib2')
makedepends=('git')
provides=('googlecl')
conflicts=('googlecl')
source=("$pkgname::git+https://github.com/vinitkumar/googlecl.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir"
  python2 setup.py install --prefix=/usr --root=$pkgdir
}
