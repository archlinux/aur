# Maintainer: bgme <i@bgme.me>

pkgname=fakehttp
_pkgname=FakeHTTP
pkgdesc="Obfuscate all your TCP connections into HTTP protocol."
pkgver=0.9.18
pkgrel=1
arch=("x86_64")
url="https://github.com/MikeWang000000/FakeHTTP"
license=("GPL-3.0-or-later")
depends=("libmnl" "libnfnetlink" "libnetfilter_queue" "nftables")

source=(
  "${pkgname}-${pkgver}::https://github.com/MikeWang000000/FakeHTTP/archive/refs/tags/${pkgver}.tar.gz"
)
sha1sums=('559cb6264e2cd32d4b68fd8d4b553f1dd3dbaf0c')
sha256sums=('c95c4d46e122390b0dcfd8509c708a6fc6817fb3e325cb966bf81a62bae973be')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  install -Dm755 build/fakehttp "${pkgdir}/usr/bin/fakehttp"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/fakehttp/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/fakehttp/LICENSE"
}
