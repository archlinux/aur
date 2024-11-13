# Maintainer: Adam Perkowski <adas1per@protonmail.com>
pkgname=memegen-git
_pkgname=memegen
pkgver=1.r0.g8cd7c18
pkgrel=1
pkgdesc='A posix shell script to generate memes from the command line'
arch=('any')
url="https://github.com/Vendicated/$_pkgname"
license=('GPL-3.0')
source=("git+https://github.com/Vendicated/$_pkgname")
sha256sums=('SKIP')
makedepends=('git')
depends=('imagemagick' 'ttf-ms-fonts')

pkgver() {
    cd "$_pkgname"
    echo "1.r$(git describe --all --long | sed 's/-/./g' | cut -d '.' -f 2-)"
}

package() {
    cd "$_pkgname"
    install -Dm0755 "$_pkgname.sh" "$pkgdir/usr/bin/$_pkgname"
}
