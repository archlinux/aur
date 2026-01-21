# Maintainer: Remilia Litjens
pkgname=ember
pkgver=1.0
pkgrel=1
pkgdesc="Ember — a minimal AUR helper written in Ruby"
arch=('x86_64' 'aarch64')
url="https://github.com/0xraincandy/ember"
license=('GPL')
depends=('ruby' 'curl' 'git')
makedepends=('base-devel')
source=("https://github.com/0xraincandy/ember/archive/refs/tags/v${pkgver}-1.tar.gz")
sha256sums=('SKIP')  # Replace with actual sha256

package() {
    # Enter the folder created when tarball is extracted
    cd "$srcdir/ember-${pkgver}-1" || exit 1

    # Install the executable
    install -Dm755 bin/emb "$pkgdir/usr/bin/emb"

    # Install the library
    install -Dm644 lib/ember.rb "$pkgdir/usr/lib/ember/ember.rb"

    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/ember/README.md"
}
