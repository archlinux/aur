# Maintainer: Samiul Quoreshi Sourav <sourav at l3v11.eu.org>

pkgname=gowitness-bin
_pkgname=${pkgname%-bin}
pkgver=3.2.0
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
sha256sums_x86_64=('d315bf505691ea64a87f6231a757acfee0a94c024ab3531f35b3c52dad15895e')
sha256sums_armv7h=('bee9838858c51fe82b8375c4744b447cf2115c5a20db0893c7588e90ba42dd2e')
sha256sums_aarch64=('bea4bc2b7935909267540ab75b23fe840aa0ac971dd743a7300ed967449addf3')

package() {
  install -Dm755 "$srcdir/${_pkgname}-$pkgver-$CARCH" "$pkgdir/usr/bin/gowitness"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
