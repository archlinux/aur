# Maintainer: Kyle McLean <kylem590@gmail.com>

pkgname=godot-mono-headless-bin
pkgver=3.5.1
pkgrel=1
pkgdesc="A headless version of the Godot game engine for running tests and exporting projects."
arch=('x86_64')
url="https://godotengine.org"
license=('MIT')
depends=('dotnet-sdk' 'mono' 'msbuild')
source=("https://downloads.tuxfamily.org/godotengine/$pkgver/mono/Godot_v$pkgver-stable_mono_linux_headless_64.zip")

sha512sums=('0e9ab52061f225f3cf2bc18ae0aaa410c3dc8805dba4e83ef634a7e06ac80656df64fe249e7969e6bc4fc60ba3b5aa3af346091d641cafb0be6b98f88f2f9451')

package() {
  mkdir -p "$pkgdir/opt/$pkgname"
  mkdir -p "$pkgdir/usr/bin"

  cp -r "$srcdir/Godot_v$pkgver-stable_mono_linux_headless_64" "$pkgdir/opt/$pkgname/godot-mono-headless"
  ln -s "/opt/$pkgname/godot-mono-headless/Godot_v$pkgver-stable_mono_linux_headless.64" "$pkgdir/usr/bin/godot-mono-headless"
}
