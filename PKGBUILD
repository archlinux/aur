# Maintainer: Emmanuel Gil Peyrot <emmanuel.peyrot@collabora.com>

pkgname='git-phab-git'
pkgver=r2.1c3ca45
pkgrel=1
pkgdesc='Git subcommand to integrate with phabricator'
arch=('any')
url='https://phabricator.freedesktop.org/project/profile/60/'
license=('GPL2')
depends=('python-gitpython' 'arcanist')
provides=('git-phab')
conflicts=('git-phab')
makedepends=('git')
source=('git://anongit.freedesktop.org/git/git-phab')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/git-phab"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/git-phab"
  install -Dm755 git-phab "$pkgdir/usr/bin/git-phab"
}
