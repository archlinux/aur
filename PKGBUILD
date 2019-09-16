# Maintainer: Ramadan Ali <rmdn@rmdn.al>
pkgname='iwlwifi-7265-ucode'
pkgver='25.30.14.0'
pkgrel=1
pkgdesc="Intel® Dual Band Wireless-AC 3165, Intel® Dual Band Wireless-AC 7265, Intel® Dual Band Wireless-N 7265, Intel® Wireless-N 7265 firmware"
arch=('any')
url='https://wireless.wiki.kernel.org'
license=('custom')
source=("https://wireless.wiki.kernel.org/_media/en/users/drivers/$pkgname-$pkgver.tgz")
sha256sums=('78611530b73e8abc9bd2da358b9d260ff7ab8e6df6925d9d8ed587ecbddb4396')

prepare() {
    bsdtar -xzf $pkgname-$pkgver.tgz
}

package() {
    mkdir -p "${pkgdir}/usr/lib/firmware/"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "${srcdir}/$pkgname-$pkgver/LICENSE.$pkgname"
    mv "$pkgdir/usr/share/licenses/$pkgname/LICENSE.$pkgname" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 -t "${pkgdir}/usr/lib/firmware/" "${srcdir}/$pkgname-$pkgver/"*.ucode
}
