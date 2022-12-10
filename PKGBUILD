# Maintainer: Sam L. Yes <samlukeyes at outlook dot com>
# Contributor: JoveYu <yushijun110@126.com>
# Contributor: Skywol <Skywol@qq.com>
# Contributor: wszqkzqk <wszqkzqk@gmail.com>
# Contributor: luosoy <249799588@qq.com>

pkgname=deepin-wine-helper
_pkgver=5.1.44-1
pkgver=${_pkgver//-/_}
pkgrel=1
pkgdesc="Deepin Wine Helper"
arch=('x86_64')
url="http://www.deepin.org"
license=('GPL' 'custom')
depends=('lib32-glibc' 'p7zip')
makedepends=('tar')
optdepends=(
    'python2: some script dependencies'
    'noto-fonts-cjk: recommended fonts'
)
source=("https://community-store-packages.deepin.com/appstore/pool/appstore/d/${pkgname}/${pkgname}_${_pkgver}_i386.deb")
sha256sums=('33068fc17e72f769bf653b8171c135ce341dacaa84797f160f2061090b509bc3')

package() {
    tar -xf data.tar.xz -C "${pkgdir}" --exclude="etc"
    cd "${pkgdir}/usr/share"
    mkdir -p licenses/$pkgname
    mv doc/$pkgname/copyright licenses/$pkgname
}
