#Maintainer: M0Rf30

pkgname=swg-git
pkgver=62.bf962e4
pkgrel=1
pkgdesc='A new generation static website generator, featured by the Mako (http://www.makotemplates.org/) template system, born from the need to have both 
performances and "WEB 2.0" contents and capabilities'
arch=('any')
url='http://www.evilsocket.net/?s=swg'
license=('GPL')
makedepends=('git')
depends=('python2' 'python2-mako')
backup=()
source=("swg::git+https://github.com/evilsocket/SWG.git")

package() {
  cd swg
  sed 's#/usr/bin/python#/usr/bin/env python2#g' -i swg/swg
  install -d -m755 $pkgdir/opt/SWG
  cp -r * $pkgdir/opt/SWG
}

pkgver() {
    cd swg
    echo $(git rev-list --count master).$(git rev-parse --short master)
}

md5sums=('SKIP')
