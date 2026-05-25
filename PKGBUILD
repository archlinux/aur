# Maintainer: CsiPA0723 <csizipeti0723 at gmail dot com>
_pkgname=weylus
pkgname="$_pkgname-community-bin"
pkgver=2026.5.22
pkgrel=1
pkgdesc="Use your tablet as graphic tablet/touch screen on your computer."
arch=("x86_64")
url="https://github.com/electronstudio/WeylusCommunityEdition"
license=("AGPL-3.0-or-later")
conflicts=("$_pkgname" "$_pkgname-bin" "$_pkgname-git")
provides=("$_pkgname=${pkgver/\.r*/}")
depends=(cairo dbus gst-plugins-base-libs libdrm libva libxcomposite libxcursor libxinerama libxkbcommon libxrandr libxtst pango ffmpeg)
optdepends=("gst-plugin-pipewire: Wayland and or pipewire support")
source=(
  "$pkgname-$pkgver.zip::https://github.com/electronstudio/WeylusCommunityEdition/releases/download/$pkgver/weylus_linux.tar.gz"
  "io.github.electronstudio.WeylusCommunityEdition.png"
  "LICENSE"
  "weylus.desktop"
)
sha256sums=(
  "f0b3012c43356961cfec38052983bf15033a4e70678b77246ad7ab3647e57576"
  "701bebf1d23a1f2a20604d23f795424bf7307dbd1c8c2a917f1b5e9f920f7827"
  "6a0edf58dc048140bcb2abca39a23c1855eecce9b937217208d9059297d3916d"
  "ed50c51a7a3d2fac7d7659666af393fe65f0616a49f9557faa788df43dd4e2d7"
)


package() {
  install -Dm0755 -t "$pkgdir/usr/bin/" "$_pkgname"
  install -Dm0755 -t "$pkgdir/usr/share/applications/" "weylus.desktop"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "LICENSE"
  install -Dm644 -t "$pkgdir/usr/share/icons/" "io.github.electronstudio.WeylusCommunityEdition.png"
}
