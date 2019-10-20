# Maintainer: Joseph Lansdowne <J49137@gmail.com>
pkgname=gw2-tools
pkgver=6
pkgrel=2
pkgdesc="Collection of small Guild Wars 2 tools"
arch=(any)
url=http://ikn.org.uk/gw2-tools
license=(BSD)
depends=(curl jshon parallel)
optdepends=('p7zip: gw2-dpsreport: support non-Zip logs, compress before upload'
            'xclip: gw2-dpsreport: copy result to clipboard')
source=("http://ikn.org.uk/files/desktop/$pkgname/$pkgname-$pkgver.tar.gz")
sha1sums=('13265ac427583d41a6eacd11eece59039bcb0a6a')

package () {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" prefix=/usr install
    install -D LICENSE "$pkgdir"/usr/share/licenses/gw2-tools/LICENSE
}
