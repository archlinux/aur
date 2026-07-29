pkgname=liber-bin
pkgver=1.0.17
pkgrel=1
pkgdesc="A browser-native email client"
arch=('x86_64')
url="https://liber.sh"
license=('LicenseRef-PolyForm-Noncommercial-1.0.0')
depends=('webkit2gtk-4.1' 'gtk3' 'dbus')
provides=('liber')
conflicts=('liber')
source=("https://github.com/nickheyer/liber-releases/releases/download/v${pkgver}/liber_${pkgver}_amd64.deb")
sha256sums=('4172fa87bab08e1f47936c59fdbf3ab874cc0b06b54012d83d37e8b06c2a0e42')

package() {
  bsdtar -O -xf "liber_${pkgver}_amd64.deb" 'data.tar.*' | bsdtar -xf - -C "${pkgdir}"
  chmod -R u=rwX,go=rX "${pkgdir}/usr"
}
