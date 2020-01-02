# Maintainer: Jiri Tyr <jiri.tyr@gmail.com>

pkgname='gbt'
pkgver='2.0.0'
pkgrel=2
pkgdesc='Highly configurable prompt builder for Bash and ZSH written in Go'
url="https://github.com/jtyr/gbt"
arch=('x86_64')
license=('MIT')
conflicts=('gbt-git')
optdepends=('nerd-fonts-dejavu-complete')
source=("https://github.com/jtyr/gbt/releases/download/v$pkgver/$pkgname-$pkgver-linux-amd64.tar.gz")
sha256sums=('be4ecfbffd6743c9c49b505a4b41d270f9779fb3035b38e44bca754c4000cf5d')

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname" -t "$pkgdir/usr/bin"
    install -Dm644 "$srcdir/$pkgname-$pkgver/"{LICENSE,README.md} -t "$pkgdir/usr/share/doc/$pkgname"
    mkdir -p "$pkgdir/usr/share/$pkgname/"
    cp -r "$srcdir/$pkgname-$pkgver/"{sources,themes} "$pkgdir/usr/share/$pkgname/"
}
