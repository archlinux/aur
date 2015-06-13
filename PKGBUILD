# Mantainer:  David Fabijan <mclenin.at.gmail.com>

pkgname=fileteasend-git
_pkgname=FileTeaSend
pkgver=20131219
pkgrel=1
pkgdesc="Easy file transfer using FileTea service, CLI interface"
arch=('any')
url="https://github.com/brechin/FileTeaSend.git"
license=('GPL3')
groups=()
depends=('python2' 'python2-requests')
makedepends=('git')
provides=()
conflicts=('')
replaces=()
backup=()
options=()
install=
source=("git+https://github.com/brechin/FileTeaSend.git")
noextract=()
md5sums=('SKIP')
sha1sums=('SKIP')

pkgver() {
  cd ${srcdir}/${_pkgname}
  git log -1 --format='%cd' --date=short | tr -d -- '-'
}


build() {
  cd ${srcdir}/${_pkgname}
  sed -i 's:#!/usr/bin/env python:#!/usr/bin/env python2:' filetea.py
  sed -i 's:logging.basicConfig(level=logging.DEBUG):logging.basicConfig(level=logging.INFO):' filetea.py
}

package() {
  cd ${srcdir}/${_pkgname}

  install -D filetea.py "$pkgdir"/usr/bin/filetea
}
