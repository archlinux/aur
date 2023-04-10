# Maintainer: Yo'av Moshe <archlinux@yoavmoshe.com>
pkgname=localcommand
_pkgname=localcommand
pkgver=0.1.1
pkgrel=0
pkgdesc="Run local commands directly from the web"
url="https://github.com/bjesus/localcommand"
arch=("any")
license=("MIT")
optdepends=('zenity')
source=("source.tar.gz::https://github.com/bjesus/$pkgname/archive/refs/tags/$pkgver.tar.gz") 
sha512sums=("e1946528088e101bb085654a733ed0dcc64235a725bb8744888e02b3ff53418eb7f49fd51599d17a6f155ac87825fa3b1f74a1f9cbbece656e4415b083f58f61")

build() {
      cd "$srcdir/$pkgname-$pkgver"
    GO111MODULE=on go build
}

package() {
    cd "$srcdir/$pkgname-$pkgver" || exit
    install -Dm0755 -t "$pkgdir/usr/bin/" "$pkgname"
    install -Dm0744 -t "$pkgdir/usr/share/applications" "$pkgname.desktop"
}

