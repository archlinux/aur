# Maintainer: Nils Werner <nils at hey dot com>
#
pkgname=just-the-browser
pkgver=1.4
pkgrel=1
pkgdesc='Remove AI features, telemetry data reporting, sponsored content, product integrations, and other annoyances from web browsers.'
license=('MIT')
arch=('any')
url='https://justthebrowser.com/'
source=("$pkgname-$pkgver.tar.gz::https://github.com/corbindavenport/just-the-browser/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('eabc1dc5f085bb7b1a40aea47f92c7bd4a6cbafd8dd21802f35d59cf3c27250f')

package() {
  cd "$pkgname-$pkgver"
  install -m 644 -D chrome/managed_policies.json "$pkgdir"/etc/opt/chrome/policies/managed/managed_policies.json
  install -m 644 -D chrome/managed_policies.json "$pkgdir"/etc/chromium/policies/managed/managed_policies.json
  install -m 644 -D firefox/policies.json "$pkgdir"/etc/firefox/policies/policies.json
}
