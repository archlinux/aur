# Maintainer: Marcel B <mr.arsikoff@gmail.com>
pkgname="sddm-silent-theme"
_upstream_name="SilentSDDM"
pkgdesc="Highly customizable SDDM theme"
pkgver=0.9.1
pkgrel=3
arch=('any')
depends=('sddm' 'qt6-svg' 'qt6-virtualkeyboard' 'qt6-multimedia-ffmpeg' 'redhat-fonts')
url='https://github.com/uiriansan/SilentSDDM'
license=('GPL-2.0-only')
source=('https://github.com/uiriansan/SilentSDDM/archive/refs/tags/v0.9.1.tar.gz')
sha256sums=('279c531216fe4d1ff83b31ed632af85b4a899ccadafc61f0a58bdae4f7201341')

package() {
    cd "$_upstream_name-$pkgver"
    rm ./*.sh
    rm -r docs
    rm -rf .github
    rm -r fonts # not used by the theme from that directory
    mkdir -p "$pkgdir/usr/share/sddm/themes/silent"
    cp -r ./* "$pkgdir/usr/share/sddm/themes/silent"
    find "$pkgdir/usr/share/sddm/themes/silent" -type d -exec chmod 755 {} +
find "$pkgdir/usr/share/sddm/themes/silent" -type f -exec chmod 644 {} +
}
