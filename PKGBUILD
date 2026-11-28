# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=astroburst-bin
pkgver=0.9.1
pkgrel=1
pkgdesc="Astronomical image processor built on WebGPU"
arch=('x86_64')
url="https://github.com/samuelkriegerbonini-dev/AstroBurst"
license=('AGPL-3.0-only')
depends=('cairo' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'libgcc' 'libsoup3' 'webkit2gtk-4.1' 'xz')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/samuelkriegerbonini-dev/AstroBurst/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/astroburst-${pkgver}-linux-x86_64.tar.gz")
sha256sums=('0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0')
sha256sums_x86_64=('f03aff668f03e6335e0d9da2bfd55c9f196236521d9231fda9a585aca0faff19')

package() {
  install -Dm755 "astroburst-${pkgver}/bin/astroburst" "${pkgdir}/usr/bin/astroburst"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
