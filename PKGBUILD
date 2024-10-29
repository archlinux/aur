# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=devtoolbox
pkgver=1.2
pkgrel=1
pkgdesc="Development tools at your fingertips"
arch=('any')
url="https://github.com/aleiepure/devtoolbox"
license=('CC0-1.0 AND GPL-3.0-or-later AND LGPL-3.0-or-later AND MIT AND Unlicense')
depends=(
  'gcr-4'
  'gtksourceview5'
  'libadwaita'
  'python-asn1crypto'
  'python-croniter'
  'python-cssbeautifier'
  'python-daltonlens'
  'python-dateutil'
  'python-gobject'
  'python-humanize'
  'python-jsbeautifier'
  'python-jsonschema'
  'python-lxml'
  'python-markdown2'
  'python-numpy'
  'python-pillow'
  'python-pygments'
  'python-pyjwt'
  'python-python-crontab'
  'python-python-lorem'
  'python-pytz'
  'python-qrcode'
  'python-rcssmin'
  'python-rjsmin'
  'python-ruamel.yaml.string'
  'python-sqlparse'
  'python-textstat'
  'python-tzlocal'
  'python-uuid6'
  'webkitgtk-6.0'
)
makedepends=(
  'blueprint-compiler'
  'git'
  'meson'
)
source=("git+https://github.com/aleiepure/devtoolbox#tag=v$pkgver")
sha256sums=('6a95c415827cc7b9720360b0bdc943094cb04541a5e68fc6ecc3e9499ccebdaf')

build() {
  arch-meson "$pkgname" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"

  cd "$pkgname"
  install -Dm644 LICENSES/MIT.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
