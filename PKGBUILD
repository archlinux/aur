# Maintainer: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>

pkgname=bugwarrior-git
pkgver=r1076.61b7c00
pkgrel=1
pkgdesc="pull issues from issue trackers into taskwarrior (GitHub, GitLab, Bitbucket, etc.)"
arch=(any)
url="https://bugwarrior.readthedocs.io"
license=('GPL3')
depends=('python2')

conflicts=(bugwarrior)
provides=(bugwarrior)

source=("bugwarrior::git+https://github.com/ralphbean/bugwarrior.git#branch=develop")
md5sums=('SKIP')

pkgver() {
  cd $srcdir/bugwarrior

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $srcdir/bugwarrior

  python2 setup.py install --root=$pkgdir --optimize=1
}
