# Author: Martin Stibor <martin.von.reichenberg@proton.me>

pkgname='opera-extras-bin'
#opera_ver: 118.0.5461.41 (Stable)
#opera_chromium_ver: 133.0.6943.143 (Extented Release - Windows)
#ffmpeg_chromium_ver: 133.0.6943.60 (Old-old-stable/Old-stable/Stable)
_pkgname='nwjs-ffmpeg-prebuilt'
pkgver=0.96.0
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
md5sums=('2cb4dee43b704b63a8300a1223453184' 'c408a301e3407c3803499ce9290515d6')

package() {
    install -d     "${pkgdir}/usr/lib/opera/lib_extra/"
    bsdtar  -xf    "${srcdir}/${pkgname}-${pkgver}.zip" \
            -C     "${pkgdir}/usr/lib/opera/lib_extra/"

    install -Dm644 "${srcdir}/COPYING" \
            -t     "${pkgdir}/usr/share/licenses/${pkgname}/"
}
