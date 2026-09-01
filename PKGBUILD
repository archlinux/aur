# Maintainer: Nils Werner <nils at hey dot com>
#
pkgname=just-the-browser-git
pkgver=r175.ec96b1b
pkgrel=1
pkgdesc='Remove AI features, telemetry data reporting, sponsored content, product integrations, and other annoyances from web browsers.'
license=('MIT')
arch=('any')
url='https://justthebrowser.com/'
provides=('just-the-browser')
conflicts=('just-the-browser')
source=("git+https://github.com/corbindavenport/just-the-browser.git")
sha512sums=('SKIP')

pkgver() {
  cd just-the-browser
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd just-the-browser
  install -m 644 -D chrome/managed_policies.json "$pkgdir"/etc/opt/chrome/policies/managed/managed_policies.json
  install -m 644 -D chrome/managed_policies.json "$pkgdir"/etc/chromium/policies/managed/managed_policies.json
  install -m 644 -D brave/managed_policies.json "$pkgdir"/etc/brave/policies/managed/managed_policies.json
  install -m 644 -D firefox/policies.json "$pkgdir"/etc/firefox/policies/policies.json
}
