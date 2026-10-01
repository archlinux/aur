# Maintainer: Nils Werner <nils at hey dot com>
#
pkgname=just-the-browser
pkgver=1.10
pkgrel=1
pkgdesc='Remove AI features, telemetry data reporting, sponsored content, product integrations, and other annoyances from web browsers.'
license=('MIT')
arch=('any')
url='https://justthebrowser.com/'
source=("$pkgname-$pkgver.tar.gz::https://github.com/corbindavenport/just-the-browser/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1b7a28262603ded872371461887c9fae9fb0665e0f0247a8f79012ebe801a71c')

package() {
  cd "$pkgname-$pkgver"
  install -m 644 -D chrome/managed_policies.json "$pkgdir"/etc/opt/chrome/policies/managed/managed_policies.json
  install -m 644 -D chrome/managed_policies.json "$pkgdir"/etc/chromium/policies/managed/managed_policies.json
  install -m 644 -D brave/managed_policies.json "$pkgdir"/etc/brave/policies/managed/managed_policies.json
  install -m 644 -D firefox/policies.json "$pkgdir"/etc/firefox/policies/policies.json
}
