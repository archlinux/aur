# Maintainer: f4iey (f4iey@f6kgl.ampr.org)

pkgname=sparksdr-bin
pkgver=2.0.18
pkgrel=1
pkgdesc="Cross platform sdr application for Hermes Lite and Open HPSDR compatible radios (Red Pitya, Apache labs)."
arch=('x86_64' 'arm' 'arm64')
url="https://www.sparksdr.com/download/"
license=("custom")
depends=('icu' 'gcc' 'openssl' 'krb5' 'portaudio')
provides=(sparksdr)

if [ "$CARCH" == "x86_64" ]; then
    debfile="SparkSDR.${pkgver}.linux-x64.deb"
    sha256sums=('SKIP')
elif [ "$CARCH" == "arm" ]; then
    debfile="SparkSDR.${pkgver}.linux-arm.deb"
    sha256sums=('SKIP')
elif [ "$CARCH" == "arm64" ]; then
    debfile="SparkSDR.${pkgver}.linux-arm64.deb"
    sha256sums=('SKIP')
fi

source=("$url${debfile}")

package() {
    cd "$srcdir"
    tar -C ${pkgdir}/ -xvf data.tar.xz
    cd "$pkgdir"
    chmod -R 755 usr/
    echo "done!"
}
