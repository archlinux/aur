# Maintainer: hinaloe <hina@hinaloe.net>

_project=rquickshare
pkgname=${_project}-bin
pkgver=0.8.2
pkgrel=1
pkgdesc="Rust implementation of NearbyShare/QuickShare from Android for Linux."
arch=('x86_64')
url='https://github.com/Martichou/rquickshare'
license=('GPL-3.0-or-later')

depends=(
    'gtk3'
    'libayatana-appindicator'
    'libwebkit2gtk-4.0.so'
)

conflicts=("${_project}")

source_x86_64=(
    https://github.com/Martichou/${_project}/releases/download/v${pkgver}/r-quick-share_${pkgver}_amd64.deb
)

sha256sums_x86_64=('061c8369fcac4dca58e8732a07525d90eb99bd4c75e669fb90434de34cab102d')


package() {
    bsdtar -xf data.tar.gz -C "${pkgdir}/"

    install -dm 755 "${pkgdir}/usr/bin"
    install -dm 755 "${pkgdir}/usr/share"
}
