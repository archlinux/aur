# Maintainer: Jiri Tyr <jiri.tyr@gmail.com>

pkgname='gbt'
pkgver='1.2.0'
pkgrel=1
pkgdesc='Highly configurable prompt builder for Bash and ZSH written in Go'
url="https://github.com/jtyr/gbt"
arch=('x86_64')
license=('MIT')
conflicts=('gbt-git')
optdepends=('nerd-fonts-complete')
source=("https://github.com/jtyr/gbt/releases/download/v$pkgver/$pkgname-$pkgver-linux-amd64.tar.gz")
sha256sums=('333a4a726ba815ab2a142174d070ac95ca87905307461b2b8b3a06eef4ecbe54')

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname" -t "$pkgdir/usr/bin"
    install -Dm644 "$srcdir/$pkgname-$pkgver/"{LICENSE,README.md} -t "$pkgdir/usr/doc/$pkgname"
    mkdir -p "$pkgdir/usr/share/$pkgname/"
    cp -r "$srcdir/$pkgname-$pkgver/"{sources,themes} "$pkgdir/usr/share/$pkgname/"
}
