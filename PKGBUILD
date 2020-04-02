# Maintainer: Joseph Lansdowne <J49137@gmail.com>
pkgname=gw2-tools
pkgver=7
pkgrel=1
pkgdesc="Collection of small Guild Wars 2 tools"
arch=(any)
url=http://ikn.org.uk/gw2-tools
license=(BSD)
depends=(curl jshon parallel)
optdepends=('p7zip: gw2-dpsreport: support non-Zip logs, compress before upload'
            'xclip: gw2-dpsreport: copy result to clipboard')
source=("http://ikn.org.uk/files/desktop/$pkgname/$pkgname-$pkgver.tar.gz")
sha1sums=('4477bfe3ace5826930845800ee511de2754ab0c7')

package () {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" prefix=/usr install
    install -D LICENSE "$pkgdir"/usr/share/licenses/gw2-tools/LICENSE
}
