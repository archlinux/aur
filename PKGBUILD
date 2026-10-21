# Maintainer: wsmajt <kacpermusz@gmail.com>
pkgname=opentracker-cli
pkgver=1.5.0beta1
pkgrel=1
_version=1.5.0-beta.1
pkgdesc="CLI for tracking AI provider usage limits (test prerelease)"
arch=('x86_64' 'aarch64')
url="https://github.com/wsmajt/opentracker"
license=('MIT')
makedepends=('go')
provides=('opentracker')
conflicts=('opentracker')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$_version.tar.gz")
sha256sums=('SKIP')

build() {
    cd "opentracker-$_version"
    make build VERSION=$_version
}

package() {
    cd "opentracker-$_version"
    make install DESTDIR="$pkgdir" PREFIX=/usr
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
