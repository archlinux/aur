# Maintainer: Akusen <akudesyn@gmail.com>
pkgname=rizoma
pkgver=1.0.0
pkgrel=1
pkgdesc="File manager for Linux, a Genoma app in Bioma's style"
arch=('any')
url="https://github.com/AkusenArcade/Rizoma"
license=('MIT')
# genoma reads, copies and draws all of it; the thumbnails other programs make
# come from theirs.
depends=('genoma>=0.1.25' 'hicolor-icon-theme' 'shared-mime-info')
optdepends=('udisks2: drives mounted and ejected'
            'bubblewrap: other programs'"'"' thumbnailers, sandboxed'
            'ffmpegthumbnailer: thumbnails of videos'
            'poppler-glib: thumbnails of PDFs'
            'xdg-terminal-exec: the desktop'"'"'s own terminal')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a842dd24c1e11a2b9e4d62e4e53db775a50aeb6a46ec24da2630dd5448ef3aa4')

package() {
  cd "Rizoma-$pkgver"
  install -dm755 "$pkgdir/usr/share/rizoma"
  cp -r genoma/. "$pkgdir/usr/share/rizoma/"
  install -Dm755 rizoma                       "$pkgdir/usr/bin/rizoma"
  install -Dm644 dev.akusen.rizoma.desktop    "$pkgdir/usr/share/applications/dev.akusen.rizoma.desktop"
  install -Dm644 assets/rizoma.svg            "$pkgdir/usr/share/icons/hicolor/scalable/apps/dev.akusen.rizoma.svg"
  install -Dm644 LICENSE                      "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
