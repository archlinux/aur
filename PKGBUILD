# Maintainer: Scott Hansen (firecat53) firecat4153 at gmail
pkgname=goobook-git
_gitname=goobook
pkgver=1.9
pkgrel=1
pkgdesc="Search your google contacts from the command-line or mutt."
arch=('any')
url="https://gitlab.com/goobook/goobook"
license=('GPL')
conflicts=('goobook')
provides=('goobook')
depends=('python2' 'python2-gdata' 'python2-setuptools'
         'python2-simplejson' 'python2-oauth2client' 'python2-httplib2')
makedepends=('git' 'python2-setuptools')
optdepends=('python2-keyring')
source=("git+https://gitlab.com/goobook/goobook.git")
md5sums=('SKIP')
install=goobook.install

pkgver() {
  cd "$_gitname"
  git describe --tags --always | sed 's|-|.|g'
}

package() {
  cd "$_gitname"
  python2 setup.py install --root="${pkgdir}" --optimize=1 || return 1
}

# vim:set ts=2 sw=2 et:
