# Maintainer: Radosław Rowicki <radrowicki at gmail dot guessit>
# Contributor: Radosław Rowicki <radrowicki at gmail dot guessit>

pkgname=i3hloc-git
_pkgname=i3hloc-git
pkgver=1.0.0
pkgrel=1
pkgdesc="Flexible scheduler for i3bar. Build from source version."
arch=('x86_64')
url="https://github.com/radrow/i3hloc"
license=('BSD3')
provides=('i3hloc-git')
conflicts=('i3hloc')
depends=('i3-wm')
makedepends=('stack' 'binutils' 'make' 'tar' 'gcc' 'awk' 'fakeroot')
source=("https://github.com/radrow/i3hloc/archive/1.0.0.zip")
sha256sums=('31dd715ebf52e5f33f748720680107d06ba439e3e7e78bc088c91d13cbd68e73')

build() {
        cd ${srcdir}/i3hloc-1.0.0
	stack build
}

package() {
        cd ${srcdir}/i3hloc-1.0.0
	install -Dm755 ${srcdir}/i3hloc-1.0.0/.stack-work/install/x86_64-linux-tinfo6/lts-13.14/8.6.4/bin/i3hloc ${pkgdir}/usr/bin/i3hloc
}
