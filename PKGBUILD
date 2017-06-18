# Maintainer: Jacob Jenner Rasmussen <jacob at jener.dk>
pkgname=dartium
pkgver=1.24.1
pkgrel=1
_branch=stable
pkgdesc="Dartium is a special build of Chromium that includes the Dart VM"
arch=('x86_64') # 'i686')
url="https://dartlang.org/"
license=('custom')
optdepends=('dart: for development')
options=('!strip')
source=("LICENSE")
sha256sums=('7a209dd1b94cabdb5ea9c6f9164b9546ffa5daaa671e7767d49510db055f5c51')
source_x86_64+=("$pkgname-$pkgver.zip::https://storage.googleapis.com/dart-archive/channels/${_branch}/release/${pkgver}/dartium/dartium-linux-x64-release.zip")
#source_i686+=("$pkgname-$pkgver.zip::https://storage.googleapis.com/dart-archive/channels/${_branch}/release/${pkgver}/dartium/dartium-linux-ia32-release.zip")
sha256sums_x86_64=('c02174a211829dda6d82330c281d6dc634feeed1736176aef51617832cf826b6')
#sha256sums_i686+=("MISSING")

package() {
	install -d $pkgdir/opt/dartium
	if [ $CARCH == "x86_64" ]
  then
		cp -a dartium-linux-x64-${_branch}-${pkgver}*/* $pkgdir/opt/dartium/
	else # i686
		cp -a dartium-linux-ia32-${_branch}-${pkgver}*/* $pkgdir/opt/dartium/
	fi

	install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
