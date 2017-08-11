pkgname=ipv6toolkit
pkgver=2.0
pkgrel=1
pkgdesc="SI6 Networks' IPv6 Toolkit, a security assessment and troubleshooting tool"
arch=(i686 x86_64)
url="https://www.si6networks.com/tools/ipv6toolkit/"
license=(GPL3)
source=("https://www.si6networks.com/tools/ipv6toolkit/ipv6toolkit-v${pkgver}.tar.gz"
        "https://www.si6networks.com/tools/ipv6toolkit/ipv6toolkit-v${pkgver}.tar.gz.sig")
sha256sums=('16f13d3e7d17940ff53f028ef0090e4aa3a193a224c97728b07ea6e26a19e987'
            'SKIP')
validpgpkeys=('666631C6D48463B28FB1E3C4AE250D551D4E7492')

build() {
  cd "$pkgname-v$pkgver"
  make PREFIX=/usr
}

package() {
  cd "$pkgname-v$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" SBINPATH="$pkgdir"/usr/bin install
}

# vim: ts=2:sw=2:et
