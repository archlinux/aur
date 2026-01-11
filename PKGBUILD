# Contributor: Ward Segers <w@rdsegers.be>

pkgname=kali-themes
pkgver=2025.4.5
pkgrel=1
pkgdesc="GTK theme included with Kali Linux"
arch=('any')
url="https://gitlab.com/kalilinux/packages/kali-themes"
license=('GPL3')
options=('!strip' '!buildflags' '!makeflags')
makedepends=('optipng' 'librsvg')
source=("https://gitlab.com/kalilinux/packages/$pkgname/-/archive/kali/$pkgver/$pkgname-kali-$pkgver.tar.gz")
sha512sums=('5cd2dbfeddc7dbafe8d9e6217863a06413858d4133f5901c73868a6845612cd5e13487c9b77a8f44791021cf7ede4ceec3f36ef13dba23c230fd7503aac278cd')

build() {
  cd "$pkgname-kali-$pkgver"
  make
}

package() {
  cd "$pkgname-kali-$pkgver"
  install -d -m755 "${pkgdir}/usr/share/"
  cp -r "share/themes" "$pkgdir/usr/share/themes"
}
