# Maintainer: dreamscached <dreamscache.d@gmail.com>
# shellcheck shell=bash

_pkgname=repomix
pkgname=$_pkgname
pkgdesc="Repomix (formerly Repopack) is a powerful tool that packs your entire repository into a single, AI-friendly file."
pkgver=0.3.6
pkgrel=1
license=("MIT")
arch=(any)
makedepends=(npm)
source=("https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
noextract=("${_pkgname}-${pkgver}.tgz")
sha256sums=(a631989af4463a4a274b9df9a1732fa9a62ac005f7e3018f538f26d0892ae3d6)

package() {
    npm install -g --omit=dev --cache "$srcdir/npm-cache" --prefix "$pkgdir/usr" "$srcdir/$_pkgname-$pkgver.tgz"
    install -Dm644 "$pkgdir/usr/lib/node_modules/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
