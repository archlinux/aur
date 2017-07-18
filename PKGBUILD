# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=commonist
pkgver=1.7.0
pkgrel=1
pkgdesc='A file upload tool for mediawiki using its api.php interface'
url="https://commons.wikimedia.org/wiki/Commons:Commonist"
arch=('any')
license=('GPL3')
depends=('java-environment')
source=("http://neonstau.de/commonist/$pkgname-$pkgver.zip")
sha256sums=('6c10c4e1e5f1a40fd0d554b89dc39dc2ff0a25ed8a1252d1a62b27f3a5f160e0')

prepare()
{
    cd "$pkgname-$pkgver"

    patch -Np1 -i "${srcdir}/../commonist.patch"
}

package()
{
    cd "$pkgname-$pkgver"

    install --mode 755 --directory "$pkgdir/usr/bin"
    install --mode 755 commonist "$pkgdir/usr/bin"

    install --mode 755 --directory "$pkgdir/usr/lib/commonist"
    install --mode 644 lib/*.jar "$pkgdir/usr/lib/commonist"
}
