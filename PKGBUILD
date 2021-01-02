# Maintainer: Joseph Lansdowne <J49137@gmail.com>
pkgname=gw2-tools
pkgver=9
pkgrel=1
pkgdesc="Collection of small Guild Wars 2 tools"
arch=(any)
url=http://ikn.org.uk/tool/gw2-tools
license=(BSD)
depends=(curl jshon parallel)
optdepends=('p7zip: gw2-dpsreport: support non-Zip logs, compress before upload'
            'xclip: gw2-dpsreport: copy result to clipboard')
source=("http://ikn.org.uk/download/tool/$pkgname/$pkgname-$pkgver.tar.gz")
sha1sums=('ff674d35ebe12ff81619e6b37a39c06cbfce729e')

package () {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" prefix=/usr install
    install -D LICENSE "$pkgdir"/usr/share/licenses/gw2-tools/LICENSE
}
