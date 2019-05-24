pkgname=newlogic
_pkgname=newlogic
pkgver=0.1.1_beta
_pkgver="0.1.1-beta"
pkgrel=2
pkgdesc="Circuit Builder Desktop Application (like mmlogic)"
arch=('any')
url="https://github.com/ericm/newlogic"
license=('MIT')
source=("${_pkgname}::git+https://github.com/ericm/newlogic.git#tag=v${_pkgver}")
sha256sums=('SKIP')

dependens=('nodejs>=10', "electron>=1.8.8")
makedepends=('npm' 'yarn' 'git')
prepare() {
  cd "${_pkgname}"
  yarn
  npm run package
}
package() {
  install -dm755  /usr/lib/node_modules/newlogic
  cp -R "$srcdir"/$_pkgname/* /usr/lib/node_modules/newlogic
  
  install -dm755 /usr/bin
  ln -s /usr/lib/node_modules/newlogic/start.js /usr/bin/newlogic
  
}
