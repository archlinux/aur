# Maintainer: Richard Neumann aka. rne <r dot neumann at homeinfo fullstop de>

pkgname='mcipc-git'
pkgver=latest
pkgrel=1
pkgdesc='Python 3 library and scripts for the RCON and Query protocol'
arch=('any')
url='https://gitlab.com/coNQP/mcipc'
license=('GPLv3')
depends=('python' 'python-docopt')
makedepends=('git' 'python')
source=("${pkgname}::git+${url}.git")
md5sums=('SKIP')
pkgdir='pkg'
srcdir='src'


pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
    cd "${srcdir}/${pkgname}"
    python setup.py install --root "${pkgdir}" --optimize=1
}
