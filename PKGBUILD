# Maintainer: Fermín Olaiz <fermin@olaiz.net>

pkgname=nutest-git
pkgver=v1.2.0.r0.gc46af12
pkgrel=1
pkgdesc="A Nushell test framework"
arch=(any)
url='https://github.com/vyadh/nutest'
license=(MIT)
depends=('nushell>=0.114.0')
makedepends=(git)
source=("$pkgname::git+$url.git")
sha256sums=(SKIP)

pkgver() {
    cd "$pkgname"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$pkgname"
    install -dm755 "$pkgdir/usr/share/nushell/modules"
    cp -r nutest "$pkgdir/usr/share/nushell/modules/"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
