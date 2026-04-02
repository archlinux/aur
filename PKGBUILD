# Maintainer: Everything2067 <anand shaurya at proton dot me>

# Previous maintainer did not add their details here.
pkgname=librewolf-extension-plasma-integration
pkgver=2.2
pkgrel=1
pkgdesc="KDE plasma browser integration extension for Librewolf"
arch=("any")
url="https://community.kde.org/Plasma/Browser_Integration"
license=("GPL-3.0-only")
depends=("plasma-browser-integration" "librewolf")
makedepends=("web-ext")
source=("$pkgname-$pkgver::git+https://invent.kde.org/plasma/plasma-browser-integration.git#tag=browser/$pkgver")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver/extension"
  web-ext build -a dist
}

package() {
  cd "$srcdir/$pkgname-$pkgver/extension"
  install -Dm644 dist/plasma_integration-$pkgver.zip "$pkgdir/usr/lib/librewolf/browser/extensions/plasma-browser-integration@kde.org.xpi"
}
