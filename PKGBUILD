pkgname=ttf-fonts-gb-deepin
pkgver=1.2
pkgrel=1
pkgdesc="GB18030 fonts from deepin"
arch=('any')
url="http://www.deepin.org"
license=('custom')
depends=('fontconfig')
source=(
    "fs-$pkgver.deb::https://com-store-packages.uniontech.com/appstore/pool/appstore/f/fonts-gb/fonts-gb-fs_$pkgver-deepin1_all.deb"
    "ht-$pkgver.deb::https://com-store-packages.uniontech.com/appstore/pool/appstore/f/fonts-gb/fonts-gb-ht_$pkgver-deepin1_all.deb"
    "kt-$pkgver.deb::https://com-store-packages.uniontech.com/appstore/pool/appstore/f/fonts-gb/fonts-gb-kt_$pkgver-deepin1_all.deb"
    "st-$pkgver.deb::https://com-store-packages.uniontech.com/appstore/pool/appstore/f/fonts-gb/fonts-gb-st_$pkgver-deepin1_all.deb"
    "xbs-$pkgver.deb::https://com-store-packages.uniontech.com/appstore/pool/appstore/f/fonts-gb/fonts-gb-xbs_$pkgver-deepin1_all.deb"
    "st-super-$pkgver.deb::https://com-store-packages.uniontech.com/appstore/pool/appstore/f/fonts-gb/fonts-gb-st-super_$pkgver-deepin1_all.deb"
)
sha256sums=('f78a32ba69666ececf12f28abca935aade1f4eea9cf18909dd03078874770954'
            '5824e25e5d27515a51a6ab79dbfd3fb60a8243222e681f071c6b11041c7da870'
            '2ae88f785c2d74c94643b0eb7eba225773a26c1286ccb000c13b756af11da569'
            '2166c9625eaa8d03edd7e6cc271f0428e5c2249a49594406611e964e60545369'
            '9f45cfb08297338213f6102e2a18171f7520a412b6514b2ce57d392f05f64ff1'
            '796b42a641eee4ca16b78a88d5e624a16dfdad8a58639a6c41fbdda9df1d7d99')
noextract=(
    "fs-$pkgver.deb"
    "ht-$pkgver.deb"
    "kt-$pkgver.deb"
    "st-$pkgver.deb"
    "xbs-$pkgver.deb"
    "st-super-$pkgver.deb"
)

package() {
    cd $srcdir
    ar x fs-$pkgver.deb
    tar xvf data.tar.xz
    ar x ht-$pkgver.deb
    tar xvf data.tar.xz
    ar x kt-$pkgver.deb
    tar xvf data.tar.xz
    ar x st-$pkgver.deb
    tar xvf data.tar.xz
    ar x xbs-$pkgver.deb
    tar xvf data.tar.xz
    ar x st-super-$pkgver.deb
    tar xvf data.tar.xz

    mkdir -p $pkgdir/usr/share/fonts/TTF/fonts-gb-deepin
    find $srcdir -name "*.ttf" -exec install -Dm644 {} -t $pkgdir/usr/share/fonts/TTF/fonts-gb-deepin \;
}
