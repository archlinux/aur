# Maintainer: Per Osbäck <per@osbeck.com>

pkgname=terraform-provider-cloudflare
pkgver=2.11.0
pkgrel=1
pkgdesc="Terraform provider for Cloudflare"
url="https://github.com/cloudflare/terraform-provider-cloudflare"
arch=("x86_64")
license=("MPL")
makedepends=("go" "git")
_gourl="github.com/terraform-providers"
source=("https://github.com/cloudflare/terraform-provider-cloudflare/archive/v$pkgver.tar.gz")
sha256sums=('d296a57dcbefd449bb2a44aec3a80ce38f5f794179843958f3dc40df07f8cc5c')


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
