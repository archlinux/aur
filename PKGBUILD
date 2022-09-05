#@IgnoreInspection BashAddShebang
# Maintainer: Jérémy "Vrakfall" Lecocq <jeremy at artphotolaurent dot be>
# Co-maintainer: Kppqju77 <ju.adde-gmail-com>
# Contributor: Bence Hornák <hornak dot bence at gmail dot com>
# Contributor: lestb <tkhdlstfl dot l plus aur at gmail dot com>
# Contributor:  danyf90 <daniele.formichelli@gmail.com>
# Contributor: Philipp Wolfer <ph.wolfer@gmail.com>
# Contributor: Joel Pedraza <joel@joelpedraza.com>
# Contributor: Jakub Schmidtke <sjakub-at-gmail-dot-com>

_rev=r01
_sdkint=32
pkgname="android-sources-${_sdkint}"
pkgver="${_rev}"
pkgrel=1
pkgdesc="Android SDK Sources, API-${_sdkint}"
arch=('any')
url="https://developer.android.com/studio/index.html"
license=('custom')
conflicts=("android-sources-${_sdkint}")
options=('!strip')
source=("https://dl.google.com/android/repository/sources-${_sdkint}_${_rev}.zip"
        "package.xml")
sha256sums=('7ebf6cb75df1b1838aedaf9eba15663f786611e1bcfbd36db2765ba410c4f345'
            '6b4fccb1627794b40b84331ffe7e7d5ecac6eef901729b34d4ab57778225bcc6')


package() {
    # Install files
    mkdir -p "${pkgdir}/opt/android-sdk/sources/"
    cp -dpr --no-preserve=ownership "${srcdir}/src" "${pkgdir}/opt/android-sdk/sources/android-${_sdkint}"
    chmod -R ugo+rX "${pkgdir}/opt"
    # Install license
    install -D -m 644 "package.xml" "${pkgdir}/usr/share/licenses/${pkgname}/package.xml"
}
