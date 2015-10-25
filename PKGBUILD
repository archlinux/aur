# Contributor: Sergey Kish <sergey.kish@gmail.com>

pkgname=csstidy
pkgver=1.4
pkgrel=2
pkgdesc="A program that optimises, formats and fixes CSS code"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/csstidy/"
license=('GPL')
depends=('gcc-libs')
makedepends=('scons')
source=(http://downloads.sourceforge.net/project/csstidy/CSSTidy%20%28C%2B%2B%2C%20stable%29/1.3/csstidy-source-$pkgver.zip
        'gcc43fix.diff')
md5sums=('8fcbf5c1c3cafd9232552b3286aabcb9'
         'a176d2ee8f12c64687d275fe6cbd0134')

build() {
  cd ${srcdir}
  patch -p1 <gcc43fix.diff
  scons || return 1
}

package() {
  install -D release/csstidy/csstidy $pkgdir/usr/bin/csstidy
}
