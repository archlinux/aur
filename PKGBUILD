# Maintainer: Michael Schubert <mschu.dev at gmail>

pkgname=paradigm-git
pkgver=0.1.12.g2f49715
pkgrel=1
pkgdesc="A factor graph framework for pathway inference on high-throughput genomic data"
arch=('i686' 'x86_64')
url="http://sbenz.github.com/Paradigm/"
license=('custom')
depends=('libdai')
makedepends=('git')
#source=($pkgname::git+https://github.com/sbenz/Paradigm.git)
source=($pkgname::git+https://github.com/aduong/Paradigm.git) # fixed for libDAI>=0.3.0
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --always | sed 's|-|.|g;s|^v||'
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 paradigm "$pkgdir/usr/bin/paradigm"
  install -Dm755 pathwaytab2daifg "$pkgdir/usr/bin/pathwaytab2daifg"
  install -Dm644 README.mediawiki "$pkgdir/usr/share/licenses/paradigm-git/LICENSE"
}

