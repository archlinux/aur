# Maintainer: minmo com <dot> gmail <at> mike <dot> maroboro

pkgname=detekt-bin
pkgdesc="Static code analysis for Kotlin"
pkgver=1.20.0
rc=1
pkgrel=1
arch=('i686' 'x86_64' 'arm' 'arm64')
url="https://github.com/detekt/detekt"
license=('Apache')
provides=("detekt-cli")
realversion="$pkgver-RC$rc"
source=($url/releases/download/v$realversion/detekt-cli-$realversion.zip)
depends=('java-runtime')
sha256sums=('f14d872c69203dbcfab8fcd7374d4495504db2fe4790b5e537503339ffb522ad')

package() {
  mkdir -p "$pkgdir/opt/detekt-cli"
  mkdir -p "$pkgdir/usr/bin"
  cp -R "${srcdir}/detekt-cli-$realversion/." "$pkgdir/opt/detekt-cli"
  ln -s "$pkgdir/opt/detekt-cli/bin/detekt-cli" "${pkgdir}/usr/bin/detekt-cli"
}
