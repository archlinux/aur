# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
# Contributor: Carl George < arch at cgtx dot us >

_name=gnome-shell-impatience
_owner=timbertson
_uuid=impatience@gfxmonk.net

pkgname=gnome-shell-extension-impatience
pkgver=0.4.6
_tag="version-$pkgver"
pkgrel=2
pkgdesc='Speed up the gnome-shell animation speed'
arch=('any')
url="https://github.com/$_owner/$_name"
license=('GPL3')
depends=('gnome-shell>=1:40' 'gnome-shell<1:43')
source=($_name-$pkgver.tar.gz::$url/archive/$_tag.tar.gz)
sha256sums=('09799f9dfceecb68ca591008d83537a788541b2500ba81ffa2120f275ed9b650')

prepare() {
    sed -i '/shell-version/s|" ]|", "42" ]|' "$srcdir"/$_name-$_tag/impatience/metadata.json
}

package() {
    cd $_name-$_tag
    install -dm755 "$pkgdir"/usr/share/gnome-shell/extensions/$_uuid
    cp -r impatience/* "$pkgdir"/usr/share/gnome-shell/extensions/$_uuid
}
