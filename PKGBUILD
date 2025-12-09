# Maintainer: Dimitrios Fasoulas <dfasoulas@gmail.com>
pkgname=ticktty
pkgver=2.0.1
pkgrel=1
pkgdesc="A stylish CLI clock and timer for your terminal"
arch=('any')
url="https://github.com/dimitrisfasoulas/ticktty.git"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
# For local development verification, skip checksums or update them after `updpkgsums`
sha256sums=('f6d83506a9c61c70d45dede492ac43c232e6892d07455f952bbc271397c3f5ba')

package() {
    npm install -g --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"

    # Fix permissions (npm install -g might mess with ownership in pkgdir)
    # Usually Arch packages unpack to /usr/lib/node_modules/ticktty and symlink bin
    # Standard archiving pattern:
    # 1. Unpack source
    # 2. cd source
    # 3. npm install
    # But for a published package on NPM registry:
}
# Note: For AUR submission, it's cleaner to fetch from git or use correct NPM tarball logic.
# Since this is a newly renamed local project, this PKGBUILD serves as a template.
