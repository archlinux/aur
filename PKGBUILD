# Maintainer: Mahor1221 <mahor1221 at pm dot me>

pkgname=codelldb-bin
_reponame=vscode-lldb
_pkgname="${pkgname%-bin}"
pkgver=1.8.1
pkgrel=1
pkgdesc="A native debugger extension for VSCode based on LLDB. Also known as vscode-lldb (NOT lldb-vscode)"
arch=("x86_64" "armv7h" "aarch64")
url="https://github.com/vadimcn/$_reponame"
license=("MIT")
provides=("$_pkgname" "$_reponame")
conflicts=("$_pkgname")

source=("$_reponame-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
source_x86_64=("$_pkgname-$pkgver-x86_64-linux.vsix::$url/releases/download/v$pkgver/$_pkgname-x86_64-linux.vsix")
source_armv7h=("$_pkgname-$pkgver-arm-linux.vsix::$url/releases/download/v$pkgver/$_pkgname-arm-linux.vsix")
source_aarch64=("$_pkgname-$pkgver-aarch64-linux.vsix::$url/releases/download/v$pkgver/$_pkgname-aarch64-linux.vsix")

sha256sums=('ac1536fe5c765587ede369fad097b04f253427bb6d267a24a5ea606f95a98e80')
sha256sums_x86_64=('1183adbccf1bf0f6fa4344d278fd1c3963e90e2753c1cb1c6dbfafc8a5411049')
sha256sums_armv7h=('21f648e522696e9af4c90cf7fcaa82b7ae52a72431140459fab2ffb3228ceaa5')
sha256sums_aarch64=('45645d6cdbb96d5bdc802ea8a85245ea46315b3f17c47411030e8b6ae9bb3f3d')

package() {
  install -dm755 "$pkgdir/usr/lib/$_pkgname/"
  install -dm755 "$pkgdir/usr/bin"
  install -Dm644 "$srcdir/$_reponame-$pkgver/LICENSE" \
    "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  cp -a "$srcdir/extension"/* "$pkgdir/usr/lib/$_pkgname/"
  ln -s "/usr/lib/$_pkgname/adapter/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
