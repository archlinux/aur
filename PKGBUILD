# Maintainer: nblock <nblock [/at\] archlinux DOT us>

_pkgname=secrate
pkgname=${_pkgname}-git
pkgver=dc9301d
pkgrel=1
pkgdesc='A command-line password management tool using GPG encryption.'
arch=('any')
url="https://gitorious.org/${_pkgname}/${_pkgname}"
license=('AGPL')
depends=('python' 'xclip' 'python-gnupg')
makedepends=('git')
provides=(${_pkgname})
source=("${_pkgname}::git://gitorious.org/${_pkgname}/${_pkgname}.git")
md5sums=('SKIP')

_gitname="master"

pkgver () {
  cd "${srcdir}/${_pkgname}"
  echo $(git describe --always | sed 's/-/./g')
}

package() {
  cd "${srcdir}/${_pkgname}"
  python setup.py install --root=${pkgdir}/ --optimize=1
}

# vim:set ts=2 sw=2 et:
