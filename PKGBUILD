# Maintainer: dreamscached <dreamscache.d@gmail.com>
# shellcheck shell=bash disable=SC2154,SC2164,SC2034

_pkgname=repomix
pkgname="$_pkgname"
pkgdesc="Repomix (formerly Repopack) is a powerful tool that packs your entire repository into a single, AI-friendly file."
pkgver=1.7.0
pkgrel=1
license=("MIT")
arch=(any)
makedepends=(npm)
depends=(nodejs)
provides=("$_pkgname")
conflicts=("$_pkgname-git")
source=("https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
noextract=("${_pkgname}-${pkgver}.tgz")
sha256sums=(bbc1a5a3e04520e903ac166868a27c7a96121d7bbdcad43fde27f9053cc5dde4)

package() {
    npm install -g --omit=dev --cache "$srcdir/npm-cache" --prefix "$pkgdir/usr" "$srcdir/$_pkgname-$pkgver.tgz"
    install -Dm644 "$pkgdir/usr/lib/node_modules/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
