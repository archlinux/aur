pkgname=cybervis
pkgver=5.0
pkgrel=1
pkgdesc="Terminal Spectral Engine — multi-mode ANSI dashboard and matrix visualizer"
arch=('x86_64')
url="https://github.com/logandaddy12-dot/cybervis"
license=('GPL3')
depends=('glibc')
makedepends=('gcc')

# Pulls the raw C code straight from your GitHub repository
source=("$pkgname-$pkgver.c::https://raw.githubusercontent.com/logandaddy12-dot/cybervis/main/Cybervis.c")

# Set to SKIP for your initial upload. 
# Optional: Replace 'SKIP' with the real hash by running `updpkgsums` later.
sha256sums=('SKIP')

build() {
    cd "$srcdir"
    
    # Updated to point to the lowercase filename that makepkg downloaded
    gcc -O3 "$pkgname-$pkgver.c" -o "$pkgname" -lm -lpthread
}

package() {
    cd "$srcdir"
    
    # Safely installs the executable file into /usr/bin/ so it's globally accessible
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
