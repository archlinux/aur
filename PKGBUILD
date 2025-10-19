# Maintainer: dreamscached <dreamscache.d@gmail.com>
# shellcheck shell=bash disable=SC2154,SC2164,SC2034

_pkgname=repomix
pkgname="$_pkgname"
pkgdesc="Repomix (formerly Repopack) is a powerful tool that packs your entire repository into a single, AI-friendly file."
pkgver=1.8.0
pkgrel=1
license=("MIT")
arch=(any)
makedepends=(npm)
depends=(nodejs)
provides=("$_pkgname")
conflicts=("$_pkgname-git")
source=("https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
noextract=("${_pkgname}-${pkgver}.tgz")
sha256sums=(82b8cc0e1ba5d249544de5e1b12be43dcf782128f1d1c6ff9bc10560595f01c2)

package() {
    npm install -g --omit=dev --cache "$srcdir/npm-cache" --prefix "$pkgdir/usr" "$srcdir/$_pkgname-$pkgver.tgz"
    install -Dm644 "$pkgdir/usr/lib/node_modules/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
