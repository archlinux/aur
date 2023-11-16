pkgname=asciit
pkgver=1.0.0
pkgrel=1
pkgdesc="A more compact and intuitive ASCII table highlighting digits and letters"
arch=('x86_64')
url="https://github.com/Q1CHENL/asciit"
license=('MIT')
# depends=('dependency1' 'dependency2')
source=("https://github.com/Q1CHENL/asciit/archive/refs/tags/v1.0.0.tar.gz")
sha256sums=('SKIP')

# executed in src directory, which is created by makepkg
prepare() {
    tar -xzf v1.0.0.tar.gz
    cd asciit-1.0.0
    # Prepare the build environment, if necessary
}

build() {
    # Build commands go here
	cd "$pkgname-$pkgver"
    cargo build --release
}

package() {
    cd "$pkgname-$pkgver"
    # Install the package into the package directory
    # For example:
    install -Dm755 "target/release/asciit" "$pkgdir/usr/bin/asciit"
}

# Optionally define check() to run a test suite
