# Maintainer: Marvin Dalheimer <me@marvin-dalheimer.de>
pkgname=godot-mono-bin
pkgver=4.2
pkgrel=1
pkgdesc="Godot is an advanced, feature packed, multi-platform 2D and 3D game engine. It provides a huge set of common tools, so you can just focus on making your game without reinventing the wheel."
arch=("i686" "x86_64" "arm32" "arm64")
url="https://www.godotengine.org"
license=('MIT')
provides=("godot" "godot-mono")
conflicts=("godot-mono")
depends=("dotnet-sdk")
source=("godot-mono.desktop" "icons.tar.gz")
source_i686=("$pkgname-$pkgver-i686.zip::https://github.com/godotengine/godot/releases/download/"$pkgver"-stable/Godot_v"$pkgver"-stable_mono_linux_x86_32.zip")
source_x86_64=("$pkgname-$pkgver-x86_64.zip::https://github.com/godotengine/godot/releases/download/"$pkgver"-stable/Godot_v"$pkgver"-stable_mono_linux_x86_64.zip")
source_arm32=("$pkgname-$pkgver-arm32.zip::https://github.com/godotengine/godot/releases/download/"$pkgver"-stable/Godot_v"$pkgver"-stable_mono_linux_arm32.zip")
source_arm64=("$pkgname-$pkgver-arm64.zip::https://github.com/godotengine/godot/releases/download/"$pkgver"-stable/Godot_v"$pkgver"-stable_mono_linux_arm64.zip")

package() {
  mkdir -p "$pkgdir/opt/$pkgname"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/icons/hicolor"
  mkdir -p "$pkgdir/usr/share/applications"

  case $CARCH in
    "i686")
      cp -r "$srcdir/Godot_v${pkgver}-stable_mono_linux_x86_32" "$pkgdir/opt/$pkgname/godot"
    ;;
    "x86_64")
      cp -r "$srcdir/Godot_v${pkgver}-stable_mono_linux_x86_64" "$pkgdir/opt/$pkgname/godot"
    ;;
    "arm32")
      cp -r "$srcdir/Godot_v${pkgver}-stable_mono_linux_arm32" "$pkgdir/opt/$pkgname/godot"
    ;;
    "arm64")
      cp -r "$srcdir/Godot_v${pkgver}-stable_mono_linux_arm64" "$pkgdir/opt/$pkgname/godot"
    ;;
  esac
  
  cp "$srcdir/godot-mono.desktop" "$pkgdir/usr/share/applications/godot-mono.desktop"
  cp -a "$srcdir/icons/." "$pkgdir/usr/share/icons/hicolor"

  case $CARCH in
    "i686")
      chmod +x "$pkgdir/opt/$pkgname/godot/Godot_v${pkgver}-stable_mono_linux.x86_32"
      ln -s "/opt/$pkgname/godot/Godot_v${pkgver}-stable_mono_linux.x86_32" "$pkgdir/usr/bin/godot-mono"
    ;;
    "x86_64")
      chmod +x "$pkgdir/opt/$pkgname/godot/Godot_v${pkgver}-stable_mono_linux.x86_64"
      ln -s "/opt/$pkgname/godot/Godot_v${pkgver}-stable_mono_linux.x86_64" "$pkgdir/usr/bin/godot-mono"
    ;;
    "arm32")
      chmod +x "$pkgdir/opt/$pkgname/godot/Godot_v${pkgver}-stable_mono_linux.arm32"
      ln -s "/opt/$pkgname/godot/Godot_v${pkgver}-stable_mono_linux.arm32" "$pkgdir/usr/bin/godot-mono"
    ;;
    "arm64")
      chmod +x "$pkgdir/opt/$pkgname/godot/Godot_v${pkgver}-stable_mono_linux.arm64"
      ln -s "/opt/$pkgname/godot/Godot_v${pkgver}-stable_mono_linux.arm64" "$pkgdir/usr/bin/godot-mono"
    ;;
  esac
}
md5sums=('c8ba9f7656b2c2db9a3ec385b3848bf5'
         '3d33c4ec9dfa6fb0f58bfed3dbfb2f0f')
md5sums_i686=('a07ec0839dee84ae66febea0e5d935b3')
md5sums_x86_64=('55e856bc2a3733c5aac96e74dd765757')
md5sums_arm32=('97ca90a486ea9a3805c91af1ce8594ea')
md5sums_arm64=('26d5318d4bacdb79e817f70c13f1e29b')
