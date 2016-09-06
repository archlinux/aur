# Maintainer: Felipe F. Tonello <eu@felipetonello.com>
# Based on tracktion-6 aur package from boltbuckle <amygdala@cheerful.com>

pkgname=tracktion-7
pkgver=7.2.1
pkgrel=1
pkgdesc="Commercial Proprietary Music Production Software"
arch=('x86_64')
url="http://www.tracktion.com/"
license=('custom')
depends=(
  'alsa-lib' 'libgl' 'desktop-file-utils' 'shared-mime-info' 'curl' 'libx11'
  'libxext' 'libxinerama' 'freetype2' 'libcurl-gnutls')
optdepends=(
  'jack: A low-latency audio server'
  'ladspa-plugins: A set of ladspa plugins'
)
source=(https://s3-us-west-2.amazonaws.com/tracktion-marketplace-public/TracktionInstall_7_Linux_64Bit_latest.deb)
md5sums=('91d1877497e5509c0ab3d684c7c34b61')
install=tracktion7.install

package() {
    tar -x --lzma -f data.tar.lzma -C "${pkgdir}"
    install -D -m 644 "$startdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
