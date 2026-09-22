# Maintainer: Matthias Braun <me@matthiasbraun.eu>
pkgname=druck
pkgver=0.1.0
pkgrel=1
pkgdesc="Print a file from the command line using the GTK print dialog"
arch=(any)
url="https://gitlab.com/bullbytes/druck"
license=(AGPL-3.0-or-later)
depends=(python python-gobject python-cairo glib2 gdk-pixbuf2 gtk4 poppler-glib)
optdepends=(
    'cups: print to local print queues'
    'avahi: find network printers via mDNS/DNS-SD'
    'evince: print preview'
)
source=("druck-${pkgver}.tar.gz::https://gitlab.com/bullbytes/druck/-/archive/v${pkgver}/druck-v${pkgver}.tar.gz")
b2sums=('5b5199b69889dc91124ac78ce4bdb76ece43d67b1852d23368ea50bf6c5da443402b156bc38ae9e200a0de1114edd4d69850cb13768360d937088ab6a1957d04')

package() {
    cd "druck-v${pkgver}"
    install -Dm755 druck      "$pkgdir/usr/bin/druck"
    install -Dm644 LICENSE    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 man/druck.1 "$pkgdir/usr/share/man/man1/druck.1"
    install -Dm644 README.md  "$pkgdir/usr/share/doc/$pkgname/README.md"
}
