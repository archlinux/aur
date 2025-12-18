# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: tee < teeaur at duck dot com >

pkgname=rare-go-bin
pkgver=0.5.4
pkgrel=1
pkgdesc="A fast text scanner/regex extractor and realtime summarizer"
arch=('x86_64' 'aarch64')
url="https://github.com/zix99/rare"
license=('GPL-3.0-or-later')
depends=('pcre2')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
replaces=('rare-bin')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/$pkgver/rare_${pkgver}_Linux_x86_64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/$pkgver/rare_${pkgver}_Linux_arm64.tar.gz")
sha256sums_x86_64=('fc5ade73807543747057fe3bfe36c78e52145434793190b1a197edb549342d39')
sha256sums_aarch64=('e456b855ae0a63e9af752ccc2bc4b1b99fe1c456974300b163f978e9d1553f33')

package() {
  install -Dm755 ${srcdir}/{rare,rare-pcre} -t "${pkgdir}/usr/bin"
  install -Dm644 ${srcdir}/README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 rare.1.gz -t "$pkgdir/usr/share/man/man1"
}

# vim:set ts=2 sw=2 et:
