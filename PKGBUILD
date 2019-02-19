# Maintainer: Philipp Wolfer <ph.wolfer@gmail.com>
pkgname=rhythmbox-plugin-listenbrainz
pkgver=1.1
pkgrel=1
pkgdesc="Rhythmbox plugin to submit your listens to ListenBrainz "
arch=('any')
url="https://github.com/phw/rhythmbox-plugin-listenbrainz"
license=('GPL')
depends=('rhythmbox>=3.0' 'python')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/phw/${pkgname}/archive/v${pkgver}.tar.gz)
sha1sums=('7c701ccd9a34339151695168e5b14134db5104d2')

package() {
    mkdir -p $pkgdir/usr/share/glib-2.0/schemas/
    mkdir -p $pkgdir/usr/share/rhythmbox/plugins/listenbrainz
    mkdir -p $pkgdir/usr/lib/rhythmbox/plugins/listenbrainz/

    cd "$srcdir/$pkgname-${pkgver}"

    install -Dm644 listenbrainz/listenbrainz.plugin $pkgdir/usr/lib/rhythmbox/plugins/listenbrainz/
    install -Dm644 listenbrainz/*.py $pkgdir/usr/lib/rhythmbox/plugins/listenbrainz/
    install -Dm644 listenbrainz/*.ui $pkgdir/usr/share/rhythmbox/plugins/listenbrainz/
    install -Dm644 listenbrainz/schema/*.gschema.xml $pkgdir/usr/share/glib-2.0/schemas
}
