# Maintainer: Nils Werner <nils at hey dot com>
#
pkgname=just-the-browser
pkgver=1.9
pkgrel=1
pkgdesc='Remove AI features, telemetry data reporting, sponsored content, product integrations, and other annoyances from web browsers.'
license=('MIT')
arch=('any')
url='https://justthebrowser.com/'
source=("$pkgname-$pkgver.tar.gz::https://github.com/corbindavenport/just-the-browser/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e406ddb3696c84b7dcd9058a9a83bbcc1093c31014e24b4cc070efd7202e4270')

package() {
  cd "$pkgname-$pkgver"
  install -m 644 -D chrome/managed_policies.json "$pkgdir"/etc/opt/chrome/policies/managed/managed_policies.json
  install -m 644 -D chrome/managed_policies.json "$pkgdir"/etc/chromium/policies/managed/managed_policies.json
  install -m 644 -D brave/managed_policies.json "$pkgdir"/etc/brave/policies/managed/managed_policies.json
  install -m 644 -D firefox/policies.json "$pkgdir"/etc/firefox/policies/policies.json
}
