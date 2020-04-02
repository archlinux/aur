# Maintainer: Scott Hansen (firecat53) firecat4153 at gmail
pkgname=goobook-git
_gitname=goobook
pkgver=3.3.3.g79ae9a3
pkgrel=1
pkgdesc="Search your google contacts from the command-line or mutt."
arch=('any')
url="https://gitlab.com/goobook/goobook"
license=('GPL')
conflicts=('goobook')
provides=('goobook')
depends=('python' 'python-simplejson' 'python-google-api-core'
         'python-google-api-python-client' 'python-googleapis-common-protos'
         'python-oauth2client')
makedepends=('git' 'python-setuptools')
source=("git+https://gitlab.com/goobook/goobook.git")
md5sums=('SKIP')
install=goobook.install

pkgver() {
  cd "$_gitname"
  git describe --tags --always | sed 's|-|.|g'
}

package() {
  cd "$_gitname"
  python setup.py install --root="${pkgdir}" --optimize=1 || return 1
}

# vim:set ts=2 sw=2 et:
