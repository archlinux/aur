# Author: Martin Stibor <martin.von.reichenberg@proton.me>

pkgname='opera-extras-bin'
#opera_ver: 117.0.5408.197 (Stable)
#opera_chromium_ver: 132.0.6834.210 (Extented Release - Windows)
#ffmpeg_chromium_ver: 132.0.6834.84 (Old-old-stable/Old-stable/Stable)
_pkgname='nwjs-ffmpeg-prebuilt'
pkgver=0.95.0
pkgrel=1
pkgdesc="Full-featured DRM playback support of pre-built BINARY FFmpeg (NW.JS) for Opera One web browser"
arch=('x86_64')
url="https://nwjs.io/"
license=('custom')
depends=('opera')
makedepends=('git' 'libarchive' 'lsb-release' 'ninja' 'nodejs' 'nodejs-nopt' 'npm')
optdepends=('chromium-widevine: Complementary codec enabling a premium web video content on Chromium based web browsers')
source=("${pkgname}-${pkgver}.zip::https://github.com/${_pkgname}/${_pkgname}/releases/download/${pkgver}/${pkgver}-linux-x64.zip"
        'COPYING')
md5sums=('74b7ca413faf42d735a9673bba1eb020' 'c408a301e3407c3803499ce9290515d6')

package() {
    install -d     "${pkgdir}/usr/lib64/opera/lib_extra/"
    bsdtar  -xf    "${srcdir}/${pkgname}-${pkgver}.zip" \
            -C     "${pkgdir}/usr/lib64/opera/lib_extra/"

    install -Dm644 "${srcdir}/COPYING" \
            -t     "${pkgdir}/usr/share/licenses/${pkgname}/"
}
