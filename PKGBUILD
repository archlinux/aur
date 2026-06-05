# Maintainer: Trey Blancher < trey at blancher dot net >
#
# Generated from npm2PKGBUILD and refined

pkgname=nodejs-gemini-cli
_npmname=@google/gemini-cli
pkgver=0.45.1
pkgrel=1
pkgdesc="The official Google Gemini CLI"
arch=('any')
url="https://github.com/google/generative-ai-js/tree/main/packages/cli"
license=('Apache-2.0')
depends=('nodejs>=20')
makedepends=('npm')
source=("https://registry.npmjs.org/$_npmname/-/${_npmname##*/}-$pkgver.tgz")
sha256sums=('a66d92d886cc51f4b920cc30f40f2cd7968f028d87770ec000c0d263f5799b52')


package() {
  # Install directly from the downloaded tarball to prevent double-downloading
  npm install -g --user root --prefix "$pkgdir/usr" "$srcdir/${_npmname##*/}-$pkgver.tgz" --cache "$srcdir/npm-cache"
  
  # Ensure clean permissions
  chown -R root:root "$pkgdir/usr"
}

# vim:set ts=2 sw=2 et:
