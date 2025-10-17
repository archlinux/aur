# Maintainer: Jason Go <jasongo@jasongo.net>
pkgname=llrt-std-sdk-bin
pkgver=0.7.0beta
_pkgver="${pkgver//beta/-beta}" # For GitHub urls
_pkgid="$pkgname-$_pkgver" # For filenames unique id
pkgrel=2
pkgdesc='Lightweight JavaScript runtime for serverless applications (STANDARD @aws-sdk bundled)'
arch=('x86_64' 'aarch64')
url='https://github.com/awslabs/llrt'
license=('Apache-2.0')
optdepends=(
  'typescript: transpiler for TypeScript code with type checking support'
  'esbuild: fast compiler and bundler for JavaScript and TypeScript'
  'swc-js-bin: drop-in replacement for Babel with compilation and polyfill support'
  'bun-bin: fast runtime, compiler, and bundler for JavaScript and TypeScript')
provides=('llrt')
conflicts=('llrt')
source=("$_pkgid-source.zip::$url/archive/refs/tags/v$_pkgver.zip")
source_x86_64=("$_pkgid-x86_64.zip::$url/releases/download/v$_pkgver/llrt-linux-x64.zip")
source_aarch64=("$_pkgid-aarch64.zip::$url/releases/download/v$_pkgver/llrt-linux-arm64.zip")
sha256sums=('e8d38b80657ea515366003b217b16a33a0214228f89d6915b52604e0c4e040c6')
sha256sums_x86_64=('12f065250f2c3f165949184017c021c97a2b7ff99fb2b89690488936e3117b14')
sha256sums_aarch64=('1e1e317f9ff44d03913d9c4f05603b4e0f5d45fbb789c7c1c28a0daf2087d328')

package() {
  install -Dm755 "$srcdir/llrt" "$pkgdir/usr/bin/llrt"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" $srcdir/llrt-$_pkgver/{LICENSE,THIRD_PARTY_LICENSES,NOTICE}
}
