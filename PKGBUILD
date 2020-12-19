# Maintainer: Berto Gomez <csberto at gmail.com>
# Contributor: Jacob Jenner Rasmussen <jacob at jener.dk>
pkgname=dartium
pkgver=1.24.2
pkgrel=2
_branch=stable
pkgdesc="Dartium is a special build of Chromium that includes the Dart VM"
arch=('x86_64')
url="https://dartlang.org/"
license=('custom')
depends=('gconf')
optdepends=('dart: for development')
options=('!strip')
source=("LICENSE")
sha256sums=('7a209dd1b94cabdb5ea9c6f9164b9546ffa5daaa671e7767d49510db055f5c51')
source_x86_64+=("$pkgname-$pkgver.zip::https://storage.googleapis.com/dart-archive/channels/${_branch}/release/${pkgver}/dartium/dartium-linux-x64-release.zip")
sha256sums_x86_64=('20144321b664d8ae13a9c674a667cb1ff7d7f0cdfb0f0897804e885e73b39f6e')

package() {
	install -d $pkgdir/opt/dartium
	cp -a dartium-linux-x64-${_branch}-${pkgver}*/* $pkgdir/opt/dartium/
	install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}