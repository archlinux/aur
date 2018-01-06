# Maintainer: Sean Enck <enckse@gmail.com>
pkgname=naaman
pkgver=0.1.0
pkgrel=2
pkgdesc="Not Another Aur MANager"
arch=("any")
url="https://github.com/enckse/$pkgname"
license=('MIT')
depends=('python' 'python-xdg' 'pyalpm' 'sudo')
optdepends=("bash-completion: for bash completions")
source=("git+$url#tag=v$pkgver")
md5sums=("SKIP")

build() {
    cd $srcdir/$pkgname
    make completions
}
package() {
    cd $srcdir/$pkgname
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm644 bin/bash.completions $pkgdir/usr/share/bash-completion/completions/$pkgname
    install -Dm755 naaman.py $pkgdir/usr/bin/naaman
}

