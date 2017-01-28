# Maintainer: Jelle van der Waa <jelle@archlinux.org>
pkgname=pkg-audit
pkgver=0.3
pkgrel=1
pkgdesc="audit installed packages against known vulnerabilities"
arch=('any')
url="https://github.com/jelly/pkg-audit"
license=('GPL')
depends=('pyalpm' 'python-requests')
makedepends=('git')
source=("pkg-audit::git+https://github.com/jelly/pkg-audit.git#tag=$pkgver")
optdepends=('sudo: for --sync')
md5sums=('SKIP')

package() {
        cd $pkgname
        install -Dm755 pkg-audit.py "${pkgdir}"/usr/bin/pkg-audit

        install -Dm644 man/pkg-audit.1 "${pkgdir}"/usr/share/man/man1/pkg-audit.1
        install -Dm644 cmp/zsh "${pkgdir}"/usr/share/zsh/site-functions/_$pkgname
}
