# Maintainer: Kyle McLean <kylem590@gmail.com>

pkgname=godot4-mono-bin
pkgver=rc2
pkgrel=1
pkgdesc="Godot Game Engine: An advanced, feature packed, multi-platform 2D and 3D game engine."
arch=('i686' 'x86_64')
url="http://www.godotengine.org"
license=('MIT')
depends=('dotnet-sdk-6.0' 'mono' 'msbuild')
source=('godot4-mono.desktop' 'icon.png')
source_i686=($pkgname-$pkgver-32bit.zip::https://downloads.tuxfamily.org/godotengine/4.0/$pkgver/mono/Godot_v4.0-${pkgver}_mono_linux_x86_32.zip)
source_x86_64=($pkgname-$pkgver-64bit.zip::https://downloads.tuxfamily.org/godotengine/4.0/$pkgver/mono/Godot_v4.0-${pkgver}_mono_linux_x86_64.zip)

sha512sums=('0658a4cbd5a5842c1c072eaca25cf243db14251b3b619afff076999ad9104e41e32a444bfbb771992ec9a990d814fcce234ff3c2a416493e5eb3a8d112b85235'
            '3598100251a74a6595ffc002df0adac18c37c9367a4ef148ef7f057d547ed15aaaa07140705d4185394b888c0f5fd8446de35f97625a80d1c3a2132a0418b71e')
sha512sums_i686=('ac31662e2da23b8d49bfd787cf62d6876929a2a9c7a5e54023b116aeb3caff9b4bcc3c0b5fd110ab8a21323ead3eb55d7005d3ad4c01ad102d7a7f2c59f0deb7')
sha512sums_x86_64=('59bb3a035178c89a04d6b010a4fb6dbe8a1977ebe4716f354e3efa36459dc44d6f5fa45831d32402e87a6dec2e6e0aa012df1d33ffe4039599e2ddcaafc2527c')

package() {
  mkdir -p "$pkgdir/opt/$pkgname"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/pixmaps"
  mkdir -p "$pkgdir/usr/share/applications"

  case $CARCH in
    "i686")
      cp -r "$srcdir/Godot_v4.0-${pkgver}_mono_linux_x86_32" "$pkgdir/opt/$pkgname/godot4-mono"
      ln -s "/opt/$pkgname/godot4-mono/Godot_v4.0-${pkgver}_mono_linux.x86_32" "$pkgdir/usr/bin/godot4-mono"
    ;;
    "x86_64")
      cp -r "$srcdir/Godot_v4.0-${pkgver}_mono_linux_x86_64" "$pkgdir/opt/$pkgname/godot4-mono"
      ln -s "/opt/$pkgname/godot4-mono/Godot_v4.0-${pkgver}_mono_linux.x86_64" "$pkgdir/usr/bin/godot4-mono"
    ;;
  esac

  cp "$srcdir/godot4-mono.desktop" "$pkgdir/usr/share/applications/godot4-mono.desktop"
  cp "$srcdir/icon.png" "$pkgdir/usr/share/pixmaps/godot4-mono.png"
}
