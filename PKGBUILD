pkgname=collab3-vst
pkgver=1.0.0
pkgrel=2
pkgdesc="CollaB3 Tone Wheel Organ (VST)"
arch=('x86_64')
license=('EULA')
url="https://github.com/augustofilocamo/superOrgan"
groups=('pro-audio' 'vst-plugins')
depends=('glibc' 'libcurl-gnutls')
makedepends=('xdg-user-dirs')
source=("https://github.com/augustofilocamo/superOrgan/releases/download/v${pkgver}/CollaB3-Installer-${pkgver}.sh")
sha256sums=('9e4c14c53ba17e9871147423016f6644f2ca366c1e8c7062e6f63a36127ed381')

package() {
	sh "${srcdir}/CollaB3-Installer-${pkgver}.sh" --tar xvf
	install -Dm755 "${srcdir}/CollaB3.so" "${pkgdir}/usr/lib/vst/CollaB3.so"
}
