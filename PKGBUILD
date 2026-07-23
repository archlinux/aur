# Maintainer: Samiul Quoreshi Sourav <sourav at l3v11.eu.org>

pkgname=gowitness-bin
_pkgname=${pkgname%-bin}
pkgver=3.1.1
pkgrel=1
pkgdesc="Web screenshot utility using Chrome Headless (binary release)"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/sensepost/gowitness"
license=('GPL-3.0-only')
depends=('chromium')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip')
source=("LICENSE::https://github.com/sensepost/gowitness/raw/${pkgver}/LICENSE")
source_x86_64=("${_pkgname}-${pkgver}-x86_64::${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-linux-amd64")
source_armv7h=("${_pkgname}-${pkgver}-armv7h::${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-linux-arm")
source_aarch64=("${_pkgname}-${pkgver}-aarch64::${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-linux-arm64")
sha256sums=('8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903')
sha256sums_x86_64=('57b3188e24782c27fdf72493ce599537efd3187d03b80f8afe733c72d68c5517')
sha256sums_armv7h=('d755b2fc0da943a73b6c68971d362d70e4ec89772c42b7830b94d651aec34d86')
sha256sums_aarch64=('a24284b4df4ea94a34edc55232b5d102555dcd01c73b1eb950ac4e304f753784')

package() {
  install -Dm755 "$srcdir/${_pkgname}-$pkgver-$CARCH" "$pkgdir/usr/bin/gowitness"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
