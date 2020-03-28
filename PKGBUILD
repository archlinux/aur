# Maintainer: Noeljnuior <liamgliamgmailcom>

pkgname=slimmy-xfwm-theme-git
pkgver=r3.a35e1d3
pkgrel=2
pkgdesc="A very slim xfwm theme for who doesn't like wm titles bars."
arch=('any')
url="https://github.com/Noeljunior/slimmy"
license=('GPL')
depends=("xfwm4")
makedepends=('git')
source=("$pkgname::git+https://github.com/Noeljunior/slimmy")
md5sums=('SKIP')

package() {
	cd $srcdir/$pkgname

    make install THEMEDIR="${pkgdir}/usr/share/themes"
}

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
