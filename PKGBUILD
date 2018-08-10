# Maintainer: Richard Neumann aka. rne <r dot neumann at homeinfo fullstop de>

pkgname='mcipc-git'
pkgver=r75.d6af25a
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
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


prepare() {
    # Clean up build dir.
    rm -rf mcipc/build
}


package() {
    cd "${srcdir}/${pkgname}"

    # Install python packages to $pkgdir
    python setup.py install --root ${pkgdir} --optimize=1
}
