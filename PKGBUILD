# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=360zip
pkgver=1.0.0.1010
pkgrel=1
pkgdesc="360Zip Archiver"
arch=('x86_64')
url="http://yasuo.360.cn/"
license=('custom')
depends=(
    'qt5-base'
)
source=(
    'https://github.com/redchenjs/aur-packages/raw/master/360zip/360zip_1.0.0.1010_amd64.deb'
)
md5sums=(
    'b368ad91d6c3667a6b3cdead857a90c9'
)

package() {
    tar -xf "${srcdir}"/data.tar.xz -C "${pkgdir}"/

    mv "${pkgdir}"/usr/lib/x86_64-linux-gnu/* "${pkgdir}"/usr/lib/
    rmdir "${pkgdir}"/usr/lib/x86_64-linux-gnu/

    mkdir "${pkgdir}"/usr/local/bin/
    ln -s /usr/local/share/360zip/360zip.sh "${pkgdir}"/usr/local/bin/360zip
}
