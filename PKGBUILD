# Maintainer: Serhan Aydinicen <saydinicen9@gmail.com>

pkgname=octopulse
_id=com.conqrex.octopulse
pkgver=0.1.0
pkgrel=1
pkgdesc='KDE Plasma 6 widget to follow GitHub Actions across all your repos and orgs (live runs, re-run/cancel, dispatch, inline logs)'
arch=('any')
url='https://github.com/Conqrex/Conqrex.OctoPulse'
license=('MIT')
depends=('plasma-workspace' 'curl')
optdepends=('libsecret: keep the GitHub token in the keyring (secret-tool)'
            'libnotify: failure/recovery desktop notifications')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('938133f16b5f7cce18bf9525ff95d97752c1a46d3ca17f345f416eb9b7b6ed45')

package() {
    install -dm755 "$pkgdir/usr/share/plasma/plasmoids/$_id"
    # the extracted tarball has one top dir; copy the plasmoid payload into place
    cp -a "$srcdir"/*/package/. "$pkgdir/usr/share/plasma/plasmoids/$_id/"
    install -Dm644 "$srcdir"/*/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir"/*/package/contents/icons/$_id.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_id.svg"
}
