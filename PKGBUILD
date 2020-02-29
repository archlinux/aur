# Maintainer: Radosław Rowicki <radrowicki at gmail dot guessit>
# Contributor: Radosław Rowicki <radrowicki at gmail dot guessit>

pkgname=i3hloc-git
_pkgname=i3hloc-git
pkgver=1.0.1
pkgrel=1
pkgdesc="Flexible scheduler for i3bar. Build from source version."
arch=('x86_64')
url="https://github.com/radrow/i3hloc"
license=('BSD3')
provides=('i3hloc-git')
conflicts=('i3hloc')
depends=('i3-wm')
makedepends=('stack' 'binutils' 'make' 'tar' 'gcc' 'awk' 'fakeroot')
source=("https://github.com/radrow/i3hloc/archive/1.0.1.zip")
sha256sums=('2e57674d2213e68660763eda6e1b3940ab3e94855483d45d0987d8b31430b017')

build() {
        cd ${srcdir}/i3hloc-1.0.1
	stack install --local-bin-path=$(pwd)/bin
}

package() {
        cd ${srcdir}/i3hloc-1.0.1
	install -Dm755 ${srcdir}/i3hloc-1.0.1/bin/i3hloc ${pkgdir}/usr/bin/i3hloc
}
