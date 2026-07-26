_themename=YoRHa-sddm-theme
pkgname=sddm-theme-yorha
pkgver=1.0.0
pkgrel=1
pkgdesc='A YoRHa-themed SDDM login screen'
arch=('any')
url='https://github.com/NeekoKun/YoRHa-sddm-theme'
license=('GPL-3.0-only')
depends=('sddm')
backup=("etc/sddm.conf.d/$_themename.conf")
source=("$pkgname-$pkgver.tar.gz::https://github.com/NeekoKun/YoRHa-sddm-theme/archive/v$pkgver.tar.gz")
sha256sums=('119d0e2d064206fc125888817433e7563a0f7e88cf1b201c7f2a1ed117bb3bc7')
install=yorha-sddm-theme.install

package() {
    cd "$srcdir/$_themename-$pkgver"
    install -dm755 "$pkgdir/usr/share/sddm/themes/$_themename"
    cp -r Assets Components fonts metadata.desktop theme.conf "$pkgdir/usr/share/sddm/themes/$_themename/"

    install -dm755 "$pkgdir/etc/sddm.conf.d"
    printf '[Theme]\nCurrent=%s\n' "$_themename" > "$pkgdir/etc/sddm.conf.d/$_themename.conf"
}
