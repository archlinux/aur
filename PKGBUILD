pkgname=ezoo-download-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="A fast, modern open-source alternative to Internet Download Manager (IDM) for Linux (prebuilt .deb)"
arch=('x86_64')
url="https://github.com/kerlif/ezoo-download"
license=('custom')
options=(!strip !debug)

depends=(
  'gcc-libs'
  'glibc'
  'fontconfig'
  'freetype2'
  'libxkbcommon'
  'libx11'
  'libxcb'
  'zlib'
  'openssl'
  'xdg-desktop-portal'
  'yt-dlp'
)

provides=('ezoo-download')
conflicts=('ezoo-download' 'ezoo-download-git')

# ضفنا حرف v قبل ${pkgver} عشان الرابط يظبط مع جيت هب
source=("https://github.com/kerlif/ezoo-download/releases/download/v${pkgver}/EzooDownload_${pkgver}_amd64.deb")

sha256sums=('6232e6418c6ca926280fe2ddc1da3bb8e7f3fbca12365706f5a6dd46668a8741')
noextract=("EzooDownload_${pkgver}_amd64.deb")

package() {
  cd "$srcdir"
  bsdtar -xf "EzooDownload_${pkgver}_amd64.deb"
  bsdtar -xpf data.tar.* -C "$pkgdir"
}
