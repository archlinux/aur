# Maintainer: 0xGingi <0xgingi@0xgingi.com>
pkgname=('html-builder-cli-git')
pkgver=3.0.0.r5.g696e94b
pkgrel=2
pkgdesc="The fastest way to package an HTML project into a fully native desktop app"
arch=('any')
url="https://github.com/yikuansun/html-builder-cli"
license=('GPL3')
makedepends=('git' 'nodejs' 'npm')
provides=('html-builder-cli')
conflicts=('html-builder-cli')
source=("git+https://github.com/yikuansun/html-builder-cli")
md5sums=('SKIP')

pkgver() {
  cd html-builder-cli
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() { 
npm pack html-builder-cli
npm install -g --prefix "$pkgdir/usr" html-builder-cli-*.tgz

}
