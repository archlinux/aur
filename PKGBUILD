# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: tee < teeaur at duck dot com >

pkgname=rare-go-bin
pkgver=0.5.6
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
sha256sums_x86_64=('cab27525ec7641e2f5605c588fa17f73e946fee7131482cbc9efa98c815813bb')
sha256sums_aarch64=('b213903e6b7ed258496c860b54db45650302ad618c3f21b7cc6c61f7d0a9214d')

package() {
  install -Dm755 ${srcdir}/{rare,rare-pcre} -t "${pkgdir}/usr/bin"
  install -Dm644 ${srcdir}/README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 rare.1.gz -t "$pkgdir/usr/share/man/man1"
}

# vim:set ts=2 sw=2 et:
