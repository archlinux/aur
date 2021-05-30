# Maintainer: E-Hern Lee <ehern.lee@gmail.com>

# TODO there's an arm64 build, implement logic
pkgname=avalonia-ilspy-bin
pkgver=7.0
pkgrel=1
url="https://github.com/icsharpcode/AvaloniaILSpy"
pkgdesc="Avalonia-based .NET Decompiler (port of ILSpy)"
arch=("x86_64")
provides=("ilspy")
depends=("dotnet-runtime")
source=("$pkgname-$pkgver.zip::https://github.com/icsharpcode/AvaloniaILSpy/releases/download/v$pkgver-rc$pkgrel/linux-x64.zip")
sha512sums=('5198eeb7afab66a1e004432a3af23962dba0d827fef37cbbfaba0870cc24a55a6a95e28bb6c78fbef4d2d870a82fe5c89cde91f762615e407d4387e64b8d624c')

package() {
  mkdir -p "$pkgdir/opt/"
  mkdir -p "$pkgdir/usr/bin/"
  cp -r "$srcdir/linux-x64/" "$pkgdir/opt/$pkgname/"
  chmod +x "$pkgdir/opt/$pkgname/ILSpy"
  ln -s "$pkgdir/opt/$pkgname/ILSpy" "$pkgdir/usr/bin/ILSpy"
}
