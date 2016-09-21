# Maintainer: Knut Sveidqvist <knsv@github.com>
# Contributor: Daneel <aur@gnoulibre.org>

pkgname=nodejs-mermaid-git
pkgver=6.0.0.r18.gaa6e15e
pkgrel=1
pkgdesc='Generation of diagram and flowchart from text in a similar manner as markdown'
arch=('any')
url='https://knsv.github.io/mermaid/'
license=('MIT')
conflicts=('nodejs-mermaid')
depends=('phantomjs')
makedepends=('npm')
source=('nodejs-mermaid-git::git+https://github.com/knsv/mermaid.git#branch=master')
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$pkgname"
  npm install -g --user root --prefix "$pkgdir"/usr
}
