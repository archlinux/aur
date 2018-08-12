# Maintainer: takeshix <kleber [at] adversec [dot] com>

_gitname=kleber
pkgname="${_gitname}-git"
pkgver=2.0.1.02643da
pkgrel=1
pkgdesc='Kleber command line client for file uploads'
url='https://kleber.io'
arch=('any')
license=('BSD-3-Clause')
depends=('python' 'python-setuptools' 'python-progressbar'
         'python-pyperclip' 'python-requests-toolbelt'
         'python-requests')
optdepends=('perl-image-exiftool')
makedepends=('git')
provides=('kleber')
conflicts=('kleber')
source=("${_gitname}::git+https://github.com/kleber-io/kleber-cli.git")
sha512sums=('SKIP')

pkgver() {
  cd ${_gitname}
  printf "%s.%s" "$(git describe --tags --abbrev=0|sed 's/^v//'|sed 's/\-/_/')" \
                 "$(git rev-parse --short HEAD)"
}

package() {
  cd ${_gitname}
  python3 setup.py install --root="$pkgdir/" --optimize=1
}

# vim: ts=2 sw=2
