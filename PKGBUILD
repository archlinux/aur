# Maintainer: Jason Go <jasongo@jasongo.net>
pkgname=llrt-no-sdk-bin
pkgver=0.7.0beta
_pkgver="${pkgver//beta/-beta}" # For GitHub urls
_pkgid="$pkgname-$_pkgver" # For filenames unique id
pkgrel=1
pkgdesc='Lightweight JavaScript runtime for serverless applications (NO @aws-sdk bundled, runtime only)'
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
source_x86_64=("$_pkgid-x86_64.zip::$url/releases/download/v$_pkgver/llrt-linux-x64-no-sdk.zip")
source_aarch64=("$_pkgid-aarch64.zip::$url/releases/download/v$_pkgver/llrt-linux-arm64-no-sdk.zip")
sha256sums=('e8d38b80657ea515366003b217b16a33a0214228f89d6915b52604e0c4e040c6')
sha256sums_x86_64=('c55879dcb3150691bdd9853e960cff3047e7f9c550c776f832bf9dad886aa623')
sha256sums_aarch64=('efea1bb318d6fddc10d10fa6555a3978156788b16c7518981d214dfcfac4efa0')

package() {
  install -Dm755 "$srcdir/llrt" "$pkgdir/usr/bin/llrt"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" $srcdir/llrt-$_pkgver/{LICENSE,THIRD_PARTY_LICENSES,NOTICE}
}
