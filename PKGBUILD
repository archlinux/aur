# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: RemixDev <RemixDev64@gmail.com>

pkgname="nodejs-deemix"
_name="${pkgname#nodejs-}"
pkgver=3.0.0
pkgrel=1
pkgdesc="A barebone deezer downloader library"
url="https://www.npmjs.com/package/deemix"
license=("GPL3")
arch=("any")
depends=("nodejs")
makedepends=("npm")
source=("http://registry.npmjs.org/$_name/-/$_name-$pkgver.tgz")
sha256sums=("870c5b4a0600425cd89d79199587875261d263cb3a1465581dfcb21e1c9f000a")
noextract=("$_name-$pkgver.tgz")

package(){
 npm install -g --cache "npm-cache" --prefix "$pkgdir/usr" root "$srcdir/$_name-$pkgver.tgz"
 # fix permission
 find "$pkgdir"/usr -type d -exec chmod 755 {} +
 # fix ownership
 chown -R root: "$pkgdir"
}
