# Maintainer: Mahor1221 <mahor1221 at pm dot me>

pkgname=codelldb-bin
_reponame=vscode-lldb
_pkgname="${pkgname%-bin}"
pkgver=1.7.4
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

sha256sums=('a3278f06ddd75016e68aed225ad4862c9c39eb344eb71ef6fc37d34fc9be51a4')
sha256sums_x86_64=('9f489edbd15aa0ef4ee6386d1cb40f2c7cab703f347ebc7c3f4855fec6e916d2')
sha256sums_armv7h=('352b7fcbc0a8617bd87be6074da5d88afb17e807122bf8b3774c1c41dfbe6a11')
sha256sums_aarch64=('64d2586b4b84868ba5d59679d0de5cd74f8c5e04c170abd0da2413034a280528')

package() {
  install -dm755 "$pkgdir/usr/lib/$_pkgname/"
  install -dm755 "$pkgdir/usr/bin"
  install -Dm644 "$srcdir/$_reponame-$pkgver/LICENSE" \
    "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  cp -a "$srcdir/extension"/* "$pkgdir/usr/lib/$_pkgname/"
  ln -s "/usr/lib/$_pkgname/adapter/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
