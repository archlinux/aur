# Maintainer: Jiri Tyr <jiri.tyr@gmail.com>

pkgname='gbt'
pkgver='1.1.7'
pkgrel=1
pkgdesc='Highly configurable prompt builder for Bash and ZSH written in Go'
url="https://github.com/jtyr/gbt"
arch=('x86_64')
license=('MIT')
conflicts=('gbt-git')
optdepends=('nerd-fonts-complete')
source=("https://github.com/jtyr/gbt/releases/download/v$pkgver/$pkgname-$pkgver-linux-amd64.tar.gz")
sha256sums=('43381907ae603aa2331335d9a5cef1f5e0306a10571cfe661256ef5a18574243')

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname" -t "$pkgdir/usr/bin"
    install -Dm644 "$srcdir/$pkgname-$pkgver/"{LICENSE,README.md} -t "$pkgdir/usr/doc/$pkgname"
    mkdir -p "$pkgdir/usr/share/$pkgname/"
    cp -r "$srcdir/$pkgname-$pkgver/"{sources,themes} "$pkgdir/usr/share/$pkgname/"
}
