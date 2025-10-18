# Maintainer: Jason Go <jasongo@jasongo.net>
pkgname=llrt-full-sdk-bin
pkgver=0.7.0beta
_pkgver="${pkgver//beta/-beta}" # For GitHub urls
_pkgid="$pkgname-$_pkgver" # For filenames unique id
pkgrel=3
pkgdesc='Lightweight JavaScript runtime for serverless applications (FULL @aws-sdk bundled)'
arch=('x86_64' 'aarch64')
url='https://github.com/awslabs/llrt'
license=('Apache-2.0')
optdepends=(
  'typescript: transpiler for TypeScript code with type checking support'
  'esbuild: fast compiler and bundler for JavaScript and TypeScript'
  'swc-js-bin: drop-in replacement for Babel with compilation and polyfill support'
  'bun-bin: fast runtime, compiler, and bundler for JavaScript and TypeScript')
provides=('llrt' 'llrt-full-sdk')
conflicts=('llrt' 'llrt-full-sdk')
source=("$_pkgid-source.zip::$url/archive/refs/tags/v$_pkgver.zip")
source_x86_64=("$_pkgid-x86_64.zip::$url/releases/download/v$_pkgver/llrt-linux-x64-full-sdk.zip")
source_aarch64=("$_pkgid-aarch64.zip::$url/releases/download/v$_pkgver/llrt-linux-arm64-full-sdk.zip")
sha256sums=('e8d38b80657ea515366003b217b16a33a0214228f89d6915b52604e0c4e040c6')
sha256sums_x86_64=('36a4e66845bab11a82763b0b90502a65d911cf29a752078a2daf34446257a94e')
sha256sums_aarch64=('7f2e06e9322e1df4220a0aec93dbe9da456470fcdced6313a87459831e96a5e8')

package() {
  install -Dm755 "$srcdir/llrt" "$pkgdir/usr/bin/llrt"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" $srcdir/llrt-$_pkgver/{LICENSE,THIRD_PARTY_LICENSES,NOTICE}
}
