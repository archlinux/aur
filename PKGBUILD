# Maintainer: MrToadie <toadie@toadie.de>

pkgname=cert-checker
pkgver=1.0.1
pkgrel=1
pkgdesc="simple validity checker for website certificates"
arch=('x86_64')
url="https://github.com/mrtoadie/go-check-cert"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go' 'base-devel')
source=("git+${url}.git")
sha256sums=('SKIP')


build() {
    cd "$srcdir/"
    # if the project uses Go‑Modules (go.mod exists):
    go mod tidy
    #go build -v -o "go-check-cert/$pkgname/"
    go build -v -o "go-check-cert/"
}

package() {
    # create target directories within the sandbox root ($pkgdir).
    install -dm755 "$pkgdir/usr/bin"
    #install -dm755 "$pkgdir/usr/share/doc/$pkgname"

    # copy the actual built binary
    #install -m755 "$srcdir/go-check-cert/$pkgname" \
    #               "$pkgdir/usr/bin/$pkgname"

    # copy config file
    #install -m644 "$srcdir/kvm-configurator/kvm-configurator/oslist.yaml" \
    #               "$pkgdir/usr/share/doc/$pkgname/oslist.yaml"
}
