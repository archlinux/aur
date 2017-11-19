# $Id$
# Maintainer: Jiri Tyr <jiri.tyr@gmail.com>

pkgname='gbt'
pkgver='1.1.2'
pkgrel=1
pkgdesc='Highly configurable prompt builder for Bash and ZSH written in Go'
url="https://github.com/jtyr/gbt"
arch=('x86_64')
license=('MIT')
optdepends=('nerd-fonts-complete')
source=("https://github.com/jtyr/gbt/releases/download/v$pkgver/$pkgname-$pkgver-linux-amd64.tar.gz")
sha256sums=('f9d74d37b3a98ed9cab5371a7e5a402fcd5e482dc30352220107af26fd0e4a4c')

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname" -t "$pkgdir/usr/bin"
    install -Dm644 "$srcdir/$pkgname-$pkgver/"{LICENSE,README.md} -t "$pkgdir/usr/doc/$pkgname"
    mkdir -p "$pkgdir/usr/share/$pkgname/"
    cp -r "$srcdir/$pkgname-$pkgver/"{sources,themes} "$pkgdir/usr/share/$pkgname/"
}
