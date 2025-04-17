# Maintainer: Essentral <you@example.com>
pkgname=thinkboxai
pkgver=1.0.0
pkgrel=1
pkgdesc="Thinkbox AI – A modern desktop interface for the Open AI API.  Repackaged from the deb file."
arch=('x86_64')
url="https://thinkboxai.com"
license=('unknown')
depends=('glibc' 'hicolor-icon-theme')
makedepends=('dpkg')
source=("https://prod-thinkboxai-setups.s3-accelerate.amazonaws.com/${pkgver}/thinkboxai_${pkgver}-1_amd64.deb")
noextract=("thinkboxai_${pkgver}-1_amd64.deb")

package() {
  mkdir -p "$srcdir/extract"
  dpkg-deb -x "${srcdir}/thinkboxai_${pkgver}-1_amd64.deb" "$srcdir/extract"
  cp -r "$srcdir/extract/"* "$pkgdir/"
}

sha256sums=('SKIP')
