# Maintainer: Per Osbäck <per@osbeck.com>

pkgname=terraform-provider-cloudflare
pkgver=2.0.0
pkgrel=1
pkgdesc="Terraform provider for Cloudflare"
url="https://github.com/terraform-providers/terraform-provider-cloudflare"
arch=("x86_64")
license=("MPL")
makedepends=("go" "git")
_gourl="github.com/terraform-providers"
source=("https://github.com/terraform-providers/terraform-provider-cloudflare/archive/v$pkgver.tar.gz")
sha256sums=('8bb0ca5afe0ed78dfbd6c3e2b2cc440713aa108403261b047d7b149fc2a1c7f5')


build() {
#    cd "$srcdir/src/$_gourl/$pkgname"
    cd "$srcdir/$pkgname-$pkgver"
    GOPATH="$srcdir" PATH="$srcdir/bin:$PATH" go get
    GOPATH="$srcdir" PATH="$srcdir/bin:$PATH" go build
}

package() {
    cd "$srcdir/bin"
    install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
