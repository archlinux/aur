# Maintainer: Jörg Thalheim <joerg@higgsboson.tk>

pkgname=git-pull-request
pkgver=20140430
pkgrel=1
pkgdesc="git command to automatically pull locally github pull requests"
arch=('any')
url="http://www.splitbrain.org/blog/2011-06/19-automate_github_pull_requests"
license=('MIT')
depends=('python2' 'git')

source=("git+https://github.com/splitbrain/git-pull-request.git")
sha1sums=("SKIP")

pkgver() {
  cd ${srcdir}/${pkgname}
  git log -1 --format='%cd' --date=short | tr -d -- '-'
}

package() {
  cd ${srcdir}/${pkgname}
  install -D -m755 git-pull-request $pkgdir/usr/bin/git-pull-request
}
