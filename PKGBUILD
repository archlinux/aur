# Maintainer: Aryan Kothari aryan@aryankothari.dev
pkgname=longhorn-backup-repacker
pkgver=v1.1.1
pkgrel=1
pkgdesc="A tool to repack Longhorn backup files"
arch=('any')
url="https://github.com/thearyadev/longhorn-backup-repacker"
license=('MIT')
depends=('go')
makedepends=('git')

source=("-.tar.gz::https://github.com/thearyadev//archive/v.tar.gz")
sha256sums=('SKIP')

build() {
    cd "-"
    export CGO_CPPFLAGS=""
    export CGO_CFLAGS=""
    export CGO_CXXFLAGS=""
    export CGO_LDFLAGS=""
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o  .
}

package() {
    cd "-"
    sudo install -Dm755 "" "/usr/bin/"
    sudo install -Dm644 LICENSE "/usr/share/licenses//LICENSE"
}
