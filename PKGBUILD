# Maintainer: Yuki Ibe <yibe\0100yibe\056org>

pkgname=smoothcsv-bin
pkgver=3.9.3
pkgrel=1
_rpmver=${pkgver}-1
pkgdesc="A powerful and intuitive tool for editing CSV files"
arch=('x86_64' 'aarch64')
url="https://smoothcsv.com/"
license=('LicenseRef-SmoothCSV')
depends=(cairo gdk-pixbuf2 webkit2gtk-4.1 gcc-libs glibc gtk3 glib2 libsoup3 hicolor-icon-theme)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("LICENSE-SmoothCSV.md::https://raw.githubusercontent.com/kohii/smoothcsv-website/refs/heads/main/src/pages/terms.md")
source_x86_64=("https://github.com/kohii/smoothcsv3/releases/download/v${pkgver}/SmoothCSV-${_rpmver}.x86_64.rpm")
source_aarch64=("https://github.com/kohii/smoothcsv3/releases/download/v${pkgver}/SmoothCSV-${_rpmver}.aarch64.rpm")
sha256sums=('21185cf5a704c8c91420cb9f25baf0937f852e3a40ada396b9f29cedf79bfab0')
sha256sums_x86_64=('516a6c4dadaa6a65be0d80e92e68ca558ecb148c349ce42339bd1c0e1e3f00aa')
sha256sums_aarch64=('9cbfc8e3a6bb2bf470ac1d0ad069178e908915e98f15525fb5023619b50ef340')

prepare() {
  sed -i '/^---$/,/^$/d' "$srcdir/LICENSE-SmoothCSV.md"
}

package() {
  cp -a "$srcdir/usr" "$pkgdir/"

  install -Dm644 "$srcdir/LICENSE-SmoothCSV.md" \
    "$pkgdir/usr/share/licenses/${pkgname}/LICENSE-SmoothCSV.md"
}
