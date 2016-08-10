# Maintainer: Felipe F. Tonello <eu@felipetonello.com>
# Based on tracktion-6 aur package from boltbuckle <amygdala@cheerful.com>

pkgname=tracktion-7
pkgver=7.1.1
pkgrel=1
pkgdesc="Commercial Proprietary Music Production Software"
arch=('x86_64')
url="http://www.tracktion.com/"
license=('custom')
depends=(
  'alsa-lib' 'mesa' 'desktop-file-utils' 'shared-mime-info' 'curl' 'libx11'
  'libxext' 'libxinerama' 'freetype2' 'libcurl-gnutls')
optdepends=(
  'jack: A low-latency audio server'
  'ladspa-plugins: a set of ladspa plugins'
)
source=(https://s3-us-west-2.amazonaws.com/tracktion-marketplace-public/TracktionInstall_7_Linux_64Bit_latest.deb)
md5sums=('7edc03f27015187413816469688a1f4f')

package() {
    tar -x --lzma -f data.tar.lzma -C "${pkgdir}"
    install -D -m 644 "$startdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
