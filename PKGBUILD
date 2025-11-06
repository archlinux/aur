# Maintainer: Yuki Ibe <yibe\0100yibe\056org>

pkgname=smoothcsv-bin
pkgver=3.8.0
pkgrel=1
_rpmver=${pkgver}-1
pkgdesc="A powerful and intuitive tool for editing CSV files"
arch=(x86_64)
url="https://smoothcsv.com/"
license=('LicenseRef-SmoothCSV')
depends=(cairo gdk-pixbuf2 webkit2gtk-4.1 gcc-libs glibc gtk3 glib2 libsoup3 hicolor-icon-theme)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("https://github.com/kohii/smoothcsv3/releases/download/v${pkgver}/SmoothCSV-${_rpmver}.x86_64_linux.rpm"
        "LICENSE-SmoothCSV.md::https://raw.githubusercontent.com/kohii/smoothcsv-website/refs/heads/main/src/pages/terms.md")
sha256sums=('fc9ad0b34257a989309e510b41286671c38137d111edefaf65a13affc192c94d'
            '0f88656d439d2bdc420308789d65f484632f0d3f7b54464f24fde19973d074a5')

prepare() {
  sed -i '/^---$/,/^$/d' "$srcdir/LICENSE-SmoothCSV.md"
}

package() {
  cp -a "$srcdir/usr" "$pkgdir/"

  install -Dm644 "$srcdir/LICENSE-SmoothCSV.md" \
    "$pkgdir/usr/share/licenses/${pkgname}/LICENSE-SmoothCSV.md"
}
