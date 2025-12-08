# Maintainer: Dimitrios Fasoulas <dfasoulas@gmail.com>
pkgname=ticktty
pkgver=1.0.0
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
sha256sums=('27877dcf64b9f6e69ba4921a1c424dc64c21e9b6cfe8c4f52c65d00b708183c4')

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
