pkgname=collab3
pkgver=1.0.0
pkgrel=1
pkgdesc="CollaB3 Tonewheel Organ (VST Plugin)"
arch=('x86_64')
url="https://librewave.com/product/collab3/"
license=('GPL3')
groups=('pro-audio' 'vst-plugins')
depends=('libcurl-gnutls' 'glibc')
source=("https://github.com/augustofilocamo/superOrgan/releases/download/v${pkgver}/CollaB3-Installer-${pkgver}.sh")
md5sums=('6f8e3d250f3287c81b30c11031b08c32')

prepare () {
	## Extract CollaB3 Tonewheel Organ
	chmod +x CollaB3-Installer-${pkgver}.sh
	sh CollaB3-Installer-${pkgver}.sh --tar xvf
}

package() {
    ## Install VST Plugin
    install -Dm755 "$srcdir/CollaB3.so" "$pkgdir/usr/lib/vst/CollaB3.so"
	
    ## Install EULA
    install -Dm644 "$srcdir/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
