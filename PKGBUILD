# Maintainer: Kyle McLean <kylem590@gmail.com>

pkgname=godot-mono-server-bin
pkgver=3.5.1
pkgrel=1
pkgdesc="A headless version of the Godot game engine optimized for running game servers."
arch=('x86_64')
url="https://godotengine.org"
license=('MIT')
depends=('dotnet-sdk' 'mono' 'msbuild')
source=("https://downloads.tuxfamily.org/godotengine/$pkgver/mono/Godot_v$pkgver-stable_mono_linux_server_64.zip")

sha512sums=('f6f1abb637c250dcad0683673df2876151983eab5faccab18b3c5ed96a2c9a87d96b05cf7b4fc5e65ee50e8e6b43d12c26847c55ca0ee343abe1b532555f202d')

package() {
  mkdir -p "$pkgdir/opt/$pkgname"
  mkdir -p "$pkgdir/usr/bin"

  cp -r "$srcdir/Godot_v$pkgver-stable_mono_linux_server_64" "$pkgdir/opt/$pkgname/godot-mono-server"
  ln -s "/opt/$pkgname/godot-mono-server/Godot_v$pkgver-stable_mono_linux_server.64" "$pkgdir/usr/bin/godot-mono-server"
}
