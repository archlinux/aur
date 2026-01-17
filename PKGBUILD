# Maintainer: Nils Werner <nils at hey dot com>
# 
pkgname=just-the-browser-git
pkgver=r67.6250d28
pkgrel=1
pkgdesc='Remove AI features, telemetry data reporting, sponsored content, product integrations, and other annoyances from web browsers.'
license=('MIT')
arch=('any')
url='https://justthebrowser.com/'
source=("git+https://github.com/corbindavenport/just-the-browser.git")
sha512sums=('SKIP')

pkgver() {
  cd just-the-browser
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd just-the-browser
  install -m 644 -D firefox/policies.json "$pkgdir"/etc/firefox/policies/policies.json
}
