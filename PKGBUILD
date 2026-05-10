# Mantenedor: Ryan Ferreira <dev.ryanmferreira@outlook.com>, Rafael Oliveira
pkgname=capybara-cli
pkgver=1.0.0
pkgrel=1
pkgdesc="A small CLI utility for displaying text next to a capybara (now also supports text files) :D"
arch=('x86_64')
url="https://github.com/ryanmferreira/capybara-cli"
license=('MIT')
depends=('gcc-libs')
makedepends=('clang' 'make' 'premake')
source=("git+$url.git")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    
    premake5 gmake
    
    export CC=clang
    export CXX=clang++
    make
}

package() {
    cd "${srcdir}/${pkgname}"
    
    install -Dm755 bin/linux_x86_64_debug/capybara "$pkgdir/usr/bin/capybara"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}