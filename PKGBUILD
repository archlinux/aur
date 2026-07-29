pkgname=liber-bin
pkgver=1.0.18
pkgrel=1
pkgdesc="A browser-native email client"
arch=('x86_64')
url="https://liber.sh"
license=('LicenseRef-PolyForm-Noncommercial-1.0.0')
depends=('webkit2gtk-4.1' 'gtk3' 'dbus')
provides=('liber')
conflicts=('liber')
source=("https://github.com/nickheyer/liber-releases/releases/download/v${pkgver}/liber_${pkgver}_amd64.deb")
sha256sums=('487aa53d42bc23631378a4f39fb066d8cc02899ea81e1ba491b2e2d0757c438d')

package() {
  bsdtar -O -xf "liber_${pkgver}_amd64.deb" 'data.tar.*' | bsdtar -xf - -C "${pkgdir}"
  chmod -R u=rwX,go=rX "${pkgdir}/usr"
}
