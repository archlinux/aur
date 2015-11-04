# Maintainer: Paulo Alexandre <paulequilibrio at gmail dot com>
# Contributor: morning_star<themorningstar@riseup.net>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Parth Buch <parthbuch115 at gmail dot com>
# Contributor: Tom Vincent <http://tlvince.com/contact/>
# Contributor: Valentin Haloiu <vially.ichb+aur@gmail.com>
# Contributor: Cluxter <contact@cluxter.email>

pkgname=meteor-js
pkgver=1.2.1
pkgrel=3
pkgdesc="Open-source JavaScript platform for building top-quality web apps in a fraction of the time."

arch=('i686' 'x86_64')
url="https://github.com/meteor/meteor"
license=('MIT')
depends=('nodejs' 'mongodb')
options=('!strip')

source_i686=("https://d3sqy0vbqsdhku.cloudfront.net/packages-bootstrap/$pkgver/meteor-bootstrap-os.linux.x86_32.tar.gz")
source_x86_64=("https://d3sqy0vbqsdhku.cloudfront.net/packages-bootstrap/$pkgver/meteor-bootstrap-os.linux.x86_64.tar.gz")

md5sums_i686=('d049cf5b015a78e6a077b0bd524f7e5b')
md5sums_x86_64=('6df11f44a485af737578b8821ef90a21')

package() {
    mkdir -p "$pkgdir/opt"
    mv .meteor "$pkgdir/opt/meteor"
    mkdir -p "$pkgdir/usr/bin/"
    METEOR_SYMLINK_TARGET="$(readlink "$pkgdir/opt/meteor/meteor")"
    METEOR_TOOL_DIRECTORY="$(dirname "$METEOR_SYMLINK_TARGET")"

    LAUNCHER="$pkgdir/opt/meteor/$METEOR_TOOL_DIRECTORY/scripts/admin/launch-meteor"
    cp "$LAUNCHER" "$pkgdir/usr/bin/meteor"
}
