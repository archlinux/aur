# Maintainer: Nils Werner <nils at hey dot com>
#
pkgname=just-the-browser
pkgver=1.3
pkgrel=1
pkgdesc='Remove AI features, telemetry data reporting, sponsored content, product integrations, and other annoyances from web browsers.'
license=('MIT')
arch=('any')
url='https://justthebrowser.com/'
source=("$pkgname-$pkgver.tar.gz::https://github.com/corbindavenport/just-the-browser/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fd75403b8e885564f73e5d75d61e420eb162afd7395522c9ff11a38f46c256a0')

package() {
  cd "$pkgname-$pkgver"
  install -m 644 -D chrome/managed_policies.json "$pkgdir"/etc/opt/chrome/policies/managed/managed_policies.json
  install -m 644 -D chrome/managed_policies.json "$pkgdir"/etc/chromium/policies/managed/managed_policies.json
  install -m 644 -D firefox/policies.json "$pkgdir"/etc/firefox/policies/policies.json
}
