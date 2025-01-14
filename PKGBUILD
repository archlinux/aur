# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs
_pkgname=memegen
pkgname=memegen-git
pkgver=r8cd7c18
pkgrel=1
pkgdesc='A posix shell script to generate memes from the command line'
arch=('any')
url="https://github.com/Vendicated/$_pkgname"
license=('GPL-3.0')
source=("git+$url")
sha256sums=('SKIP')
makedepends=('git')
depends=('bash' 'imagemagick' 'ttf-ms-fonts')

pkgver() {
    cd "$_pkgname"
    echo "r$(git rev-parse --short HEAD)"
}

package() {
    cd "$_pkgname"
    install -Dm0755 "$_pkgname.sh" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 "COPYING" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
    install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/$_pkgname"
}
