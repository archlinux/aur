# Maintainer: Per Osbäck <per@osbeck.com>

pkgname=terraform-provider-cloudflare
pkgver=2.12.0
pkgrel=1
pkgdesc="Terraform provider for Cloudflare"
url="https://github.com/cloudflare/terraform-provider-cloudflare"
arch=("x86_64")
license=("MPL")
makedepends=("go" "git")
_gourl="github.com/terraform-providers"
source=("https://github.com/cloudflare/terraform-provider-cloudflare/archive/v$pkgver.tar.gz")
sha256sums=('2fed9b23fba5957d0a78bab851351d8867256ce39c47ab7196ca551ce35cac79')


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
