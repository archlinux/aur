# Maintainer: Your Name <youremail@domain.com>
pkgname=gplaycli-git
pkgver=0.1.2.r22.g1c17621
pkgrel=1
pkgdesc="Google Play Downloader via Command line, based on https://codingteam.net/project/googleplaydownloader"
arch=('i686' 'x86_64')
url="https://github.com/matlink/gplaycli"
license=('AGPL')
depends=('python2'
         'python2-protobuf'
         'python2-requests'
         'wxpython'
         'python2-ndg-httpsclient'
         'python2-androguard-git'
         'python2-clint')
optdepends=('java-runtime: needed for autogeneration of a new AndroiID')
source=("gplaycli::git+https://github.com/matlink/gplaycli.git")
md5sums=("SKIP")

pkgver() {
  cd "gplaycli"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'

}

package() {
  cd gplaycli
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
