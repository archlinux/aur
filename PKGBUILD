# Maintainer: Richard Neumann aka. rne <r dot neumann at homeinfo fullstop de>

pkgname="python-usernotify-git"
pkgver=latest
pkgrel=1
pkgdesc="Python 3 library and scripts for notifying desktop users"
arch=('any')
url='https://gitlab.com/coNQP/notify-users'
license=('GPLv3')
depends=('python' 'libnotify')
optdepends=('python-docopt: scripts')
makedepends=('git' 'python')
source=("${pkgname}::git+${url}.git")
md5sums=('SKIP')
pkgdir='pkg'
srcdir='src'


pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
    cd "${srcdir}/${pkgname}"

    # Install python packages to $pkgdir
    python setup.py install --root ${pkgdir} --optimize=1
}