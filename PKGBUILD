# Maintainer: Shyamin Ayesh <me@shyamin.com>

pkgname="libnss-aad"
pkgdesc="Name Service Switch (NSS) Module for Azure Entra ID"
pkgver=0.5.2
pkgrel=1
arch=("x86_64")
license=("GPL-3.0-only")
url="https://github.com/aad-for-linux/$pkgname"
source=("http://security.ubuntu.com/ubuntu/pool/universe/a/aad-auth/libnss-aad_0.5.2_amd64.deb")
sha256sums=("cb64026fcd246fa4a323944607e32a6107ec871d44b58f288e118fbc98ea0aa2")

prepare() {
    tar -xf data.tar.zst
}

package() {

    # CREATE DIRs
    install -d "$pkgdir"/usr/lib/
    install -d "$pkgdir"/usr/share/doc/"$pkgname"

    # Install ( .so / copyright )
    install -D "$srcdir"/usr/lib/x86_64-linux-gnu/libnss_aad.so.2 "$pkgdir"/usr/lib/
    install -D "$srcdir"/usr/share/doc/libnss-aad/copyright "$pkgdir"/usr/share/doc/"$pkgname"/copyright

}