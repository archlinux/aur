# Maintainer: Radosław Rowicki <radrowicki at gmail dot guessit>
# Contributor: Radosław Rowicki <radrowicki at gmail dot guessit>

pkgname=i3hloc-git
_pkgname=i3hloc-git
pkgver=0.2.0.0
pkgrel=1
pkgdesc="Flexible scheduler for i3bar. Build from source version."
arch=('x86_64')
url="https://github.com/radrow/i3hloc"
license=('BSD3')
provides=('i3hloc-git')
conflicts=('i3hloc')
depends=('i3-wm')
makedepends=('stack' 'binutils' 'make' 'tar' 'gcc' 'awk' 'fakeroot')
source=("https://github.com/radrow/i3hloc/archive/master.zip")
sha256sums=('decd14d7a4df8ad7c0ac222f24d9d5c84714dad0365de90d3ec875ed2abfacbb')

build() {
        cd ${srcdir}/i3hloc-master
	stack build
}

package() {
        cd ${srcdir}/i3hloc-master
	install -Dm755 ${srcdir}/i3hloc-master/.stack-work/install/x86_64-linux-tinfo6/lts-13.14/8.6.4/bin/i3hloc ${pkgdir}/usr/bin/i3hloc
}
