# Maintainer: Fabio J Matos Nieves <fabio.matos999@gmail.com>
pkgname=waytrogen-bin
pkgver=0.8.0
pkgdesc='A lightning fast gui wallpaper setter written in Rust.'
depends=('ffmpeg' 'gtk4>=4.12.0' 'gettext' 'sqlite' 'glib2' 'gobject-introspection' 'graphene' 'harfbuzz' 'fribidi' 'fontconfig' 'libepoxy' 'libxi' 'libx11' 'libcloudproviders' 'tinysparql' 'libpng' 'libtiff' 'libjpeg-turbo' 'libxkbcommon' 'wayland' 'libxext' 'libxcursor' 'libxdamage' 'libxfixes' 'libxrandr' 'libxinerama' 'libthai' 'libthai' 'zlib' 'freetype2' 'libxrender' 'libxcb' 'pixman' 'util-linux-libs' 'libffi' 'pcre' 'graphite' 'expat' 'json-glib' 'libxml2' 'zstd' 'xz' 'lzo' 'libdatrie' 'bzip2' 'brotli' 'libxau' 'libxdmcp' 'icu' 'bash' )
url="https://github.com/nikolaizombie1/waytrogen"
source=(https://github.com/nikolaizombie1/waytrogen/releases/download/${pkgver}/waytrogen_${pkgver}_amd64 "$pkgname-$pkgver.tar.gz::https://github.com/nikolaizombie1/waytrogen/archive/refs/tags/"$pkgver".tar.gz")
options=(!'debug')
pkgrel=1
conflicts=('waytrogen')
makedepends=('meson' 'ninja' 'unzip' )
optdepends=('hyprpaper: hyprland wallpaper setter'
	    'swaybg: sway wallpaper setter'
	    'mpvpaper: animated wallpapers using mpv'
	    'swww: wallpaper setter with transitions')
arch=('x86_64')
license=('Unlicence')
sha256sums=('SKIP' 'SKIP')

build() {
  tar -xzf "$pkgname-$pkgver.tar.gz"
}


package() {
  cd "waytrogen-$pkgver"
  meson setup builddir --prefix=/usr -Dprecompiled_binary=$(realpath ../waytrogen_${pkgver}_amd64)
  meson install -C builddir --destdir "$pkgdir"
}
