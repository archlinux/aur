# Maintainer: Jelle van der Waa <jelle@archlinux.org>
pkgname=pkg-audit
pkgver=0.1
pkgrel=1
pkgdesc="audit installed packages against known vulnerabilities"
arch=('any')
url="https://github.com/jelly/arch-audit"
license=('GPL')
depends=('pyalpm' 'python-requests')
source=("pkg-audit::git+https://github.com/jelly/arch-audit.git#tag=$pkgver")
optdepends=('sudo: for --sync')
md5sums=('SKIP')

package() {
        cd $pkgname
        install -Dm755 pkg-audit.py $pkgdir/usr/bin/pkg-audit

        install -Dm644 man/pkg-audit.1 $pkgdir/usr/share/man/man1/pkg-audit.1
        #gunzip $pkgdir/usr/share/man/man1/pkg-audit.1
}
