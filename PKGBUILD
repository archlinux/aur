# Maintainer: Abrer <ahbrer@gmail.com> 

pkgname='dkoch-git'
pkgver=8.10ba713
pkgrel=1
arch=('any')
url="https://gitlab.com/big-friendian/dkoch"
license=('MIT')
pkgdesc="A program for learning morse code using the Koch and/or Farnsworth methods."
depends=(   "dmd"
            "dub"
            "sdl2"   )
source=("$pkgname"::'git+https://gitlab.com/big-friendian/dkoch.git')

md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
    cd "$pkgname"
    dub build --build=release
}

package() {
    cd "$pkgname"
    mkdir -p $pkgdir/usr/bin/
    cp dkoch $pkgdir/usr/bin/
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
