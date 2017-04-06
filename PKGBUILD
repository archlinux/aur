# Maintainer: Swift Geek
pkgname=authprogs-git
_pkgname=authprogs
pkgver=a
pkgrel=1
pkgdesc="SSH Command Authenticator"
arch=('i686' 'x86_64' 'armv7h' 'armv6h')
url="https://github.com/daethnir/authprogs/"
license=('GPL')
depends=('python2')
makedepends=('git' 'ruby-ronn' 'python-markdown')
source=("git://github.com/daethnir/authprogs.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git rev-parse --short HEAD # Fix to better comply with github display
}

package() {
  cd "$srcdir/${_pkgname}"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
