#Maintainer: Trevor Bergeron <mal@sec.gd>

_pkgname=libcwtch-go
pkgname=$_pkgname

_pkgver=1.0.0
pkgver="${_pkgver//-/_}"
pkgrel=1

pkgdesc="C bindings for the Go Cwtch library"
conflicts=('libcwtch-go-bin')
# Likely works on others, please report your success
arch=('x86_64')
url='https://cwtch.im'
license=('MIT')
source=("https://git.openprivacy.ca/cwtch.im/$_pkgname/archive/v$_pkgver.tar.gz")
sha512sums=('92f4e6fdb42bbd8003e3def82ab7c21383136eb941da85f2cae4fd05df2e975543ca475ac228d28dcd2de8ce3a1d9e8132ceef38e4969870af7fe262ae0bf4c1')

build() {
    cd "$srcdir/$_pkgname"
    GOPATH="$srcdir/go" make linux
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm0644 libCwtch.so -t "$pkgdir/usr/lib/"
}
