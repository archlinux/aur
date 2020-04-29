# Maintainer: Alwyn Kik <alwyn@kik.pw>

pkgname=terraform-provider-gandi
pkgver=1.1.1
pkgrel=1
pkgdesc="Terraform provider for Cloudflare"
url="https://github.com/tiramiseb/terraform-provider-gandi"
arch=("x86_64")
license=("MPL")
makedepends=("go" "git")
_gourl="github.com/terraform-providers"
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('b9bc76980250504820b4c66bc31d461c7bd1fad48acbbeab5aa33bf788c8816f')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    #GOPATH="$srcdir" PATH="$srcdir/bin:$PATH" go get
    GOPATH="$srcdir" PATH="$srcdir/bin:$PATH" go build -o terraform-provider-gandi
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}

