# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=('xapp-thumbnailers-common'
         'xapp-mp3-thumbnailer'
         'xapp-epub-thumbnailer'
         'xapp-raw-thumbnailer'
         'xapp-vorbiscomment-thumbnailer'
         'xapp-appimage-thumbnailer'
         'xapp-gimp-thumbnailer'
         'xapp-jxl-thumbnailer'
         'xapp-ora-thumbnailer')
pkgbase=xapp-thumbnailers
pkgver=1.2.6
pkgrel=1
pkgdesc="Thumbnailers for GTK Desktop Environments"
arch=('any')
url="https://github.com/linuxmint/xapp-thumbnailers"
license=('GPL-3.0-or-later')
makedepends=('meson')
source=("$pkgbase-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('7e4c6cc0c140fe3813cc6b877e952cca9e300cd00a204c2b8ed7c73a3369d14b')

build() {
  arch-meson "$pkgbase-$pkgver" build
  meson compile -C build
}

package_xapp-thumbnailers-common() {
  pkgdesc="Common files for XApp thumbnailers"
  depends=(
    'gdk-pixbuf2'
    'python-gobject'
    'python-pillow'
    'python-xapp'
    )

  meson install -C build --destdir "$pkgdir"

  rm -rf "$pkgdir"/usr/{bin,share}
}

package_xapp-mp3-thumbnailer() {
  pkgdesc="MP3 thumbnailer"
  depends=(
    'python-eyed3'
    'xapp-thumbnailers-common'
    )

  cd "$pkgbase-$pkgver"
  install -Dm755 "files/usr/bin/$pkgname" -t "$pkgdir/usr/bin/"
  install -Dm644 "files/usr/share/thumbnailers/$pkgname.thumbnailer" -t \
    "$pkgdir/usr/share/thumbnailers/"
}

package_xapp-epub-thumbnailer() {
  pkgdesc="ePub thumbnailer"
  depends=('xapp-thumbnailers-common')

  cd "$pkgbase-$pkgver"
  install -Dm755 "files/usr/bin/$pkgname" -t "$pkgdir/usr/bin/"
  install -Dm644 "files/usr/share/thumbnailers/$pkgname.thumbnailer" -t \
    "$pkgdir/usr/share/thumbnailers/"
}

package_xapp-raw-thumbnailer() {
  pkgdesc="RAW thumbnailer"
  depends=(
    'dcraw'
    'xapp-thumbnailers-common'
    )

  cd "$pkgbase-$pkgver"
  install -Dm755 "files/usr/bin/$pkgname" -t "$pkgdir/usr/bin/"
  install -Dm644 "files/usr/share/thumbnailers/$pkgname.thumbnailer" -t \
    "$pkgdir/usr/share/thumbnailers/"
}

package_xapp-vorbiscomment-thumbnailer() {
  pkgdesc="VorbisComment thumbnailer"
  depends=(
    'python-mutagen'
    'xapp-thumbnailers-common'
    )

  cd "$pkgbase-$pkgver"
  install -Dm755 "files/usr/bin/$pkgname" -t "$pkgdir/usr/bin/"
  install -Dm644 "files/usr/share/thumbnailers/$pkgname.thumbnailer" -t \
    "$pkgdir/usr/share/thumbnailers/"
}

package_xapp-appimage-thumbnailer() {
  pkgdesc="AppImage thumbnailer"
  depends=(
    'python-pyelftools'
    'squashfs-tools'
    'xapp-thumbnailers-common'
    )

  cd "$pkgbase-$pkgver"
  install -Dm755 "files/usr/bin/$pkgname" -t "$pkgdir/usr/bin/"
  install -Dm644 "files/usr/share/thumbnailers/$pkgname.thumbnailer" -t \
    "$pkgdir/usr/share/thumbnailers/"
}

package_xapp-gimp-thumbnailer() {
  pkgdesc="GIMP thumbnailer"
  depends=('xapp-thumbnailers-common')

  cd "$pkgbase-$pkgver"
  install -Dm755 "files/usr/bin/$pkgname" -t "$pkgdir/usr/bin/"
  install -Dm644 "files/usr/share/thumbnailers/$pkgname.thumbnailer" -t \
    "$pkgdir/usr/share/thumbnailers/"
}

package_xapp-jxl-thumbnailer() {
  pkgdesc="JPEG XL thumbnailer"
  depends=(
    'libjxl'
    'xapp-thumbnailers-common'
    )

  cd "$pkgbase-$pkgver"
  install -Dm755 "files/usr/bin/$pkgname" -t "$pkgdir/usr/bin/"
  install -Dm644 "files/usr/share/thumbnailers/$pkgname.thumbnailer" -t \
    "$pkgdir/usr/share/thumbnailers/"
}

package_xapp-ora-thumbnailer() {
  pkgdesc="OpenRaster thumbnailer"
  depends=('xapp-thumbnailers-common')

  cd "$pkgbase-$pkgver"
  install -Dm755 "files/usr/bin/$pkgname" -t "$pkgdir/usr/bin/"
  install -Dm644 "files/usr/share/thumbnailers/$pkgname.thumbnailer" -t \
    "$pkgdir/usr/share/thumbnailers/"
}
