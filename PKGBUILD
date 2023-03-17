# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Giorgio Wicklein <giowckln@gmail.com>
# Contributor: Oirio Joshi <joshirio@protonmail.com>

pkgname=symphytum
pkgver=2.6
pkgrel=4
pkgdesc='Personal database software for everyone who desires to manage and organize data in an easy and intuitive way'
arch=('x86_64')
url='https://github.com/giowck/symphytum'
license=('BSD')
depends=('hicolor-icon-theme' 'qt5-svg')
optdepends=('python-dropbox: sync with Dropbox')
source=("https://github.com/giowck/symphytum/releases/download/v$pkgver/$pkgname-$pkgver-src.tar.gz"
        'symphytum.appdata.xml')
sha256sums=('6b04868b5b0f34e8a1d6a20f1dd41aae62e819a8c7540ac83a11ba4dcea5e8a1'
            '3f7049c62862ffb4a2672c36f125bca491753da67cf1e7da1a8651815308e180')

build() {
  qmake-qt5
  make
}

package() {
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 stuff/installers/deb/usr/share/symphytum/sync/dropbox_client.py "$pkgdir/usr/share/symphytum/sync/dropbox_client.py"
  install -Dm644 stuff/installers/deb/usr/share/applications/$pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 stuff/installers/deb/usr/share/pixmaps/$pkgname.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
  install -Dm644 $pkgname.appdata.xml "$pkgdir/usr/share/metainfo/$pkgname.appdata.xml"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
