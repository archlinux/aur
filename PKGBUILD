# Maintainer: Andrew Simmons <agsimmons0 at gmail dot com>
# Contributor:: Tab Fitts <tfitts [at] spryservers [dot] net>

pkgname=splashtop-business
pkgver=3.6.0.0
pkgrel=2
pkgdesc="Splashtop Business. Remotely access your desktop from any device from anywhere!"
arch=('x86_64')
url="https://www.splashtop.com/business"
license=('Proprietary')
depends=('bash-completion' 'curl>=7.47.0' 'ffmpeg' 'gcc>=3.0' 'hicolor-icon-theme' 'keyutils>=1.5.6' 'libpulse' 'libxcb>=1.3' 'qt5-base>=5.5.0' 'gtk3>=3.5.12' 'gdk-pixbuf2' 'tracker3-docs' 'util-linux-libs' 'xcb-util>=0.4.0' 'xcb-util-keysyms>=0.4.0' 'binutils' 'libxrandr' 'libxfixes' 'uriparser')
provides=('splashtop-business')
options=('!strip')
install=${pkgname}.install
source=("https://download.splashtop.com/linuxclient/${pkgname}_Ubuntu_v${pkgver}_amd64.tar.gz")
sha256sums=('a4a016ac3409317dc1ce777d4418dedd36b33ef9a5d232df1838e0e7975081ca')

prepare(){
    ar x splashtop-business_Ubuntu_amd64.deb
}

package(){
	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

    mkdir -m 777 "$pkgdir/opt/splashtop-business/config"
    mkdir -m 755 "$pkgdir/opt/splashtop-business/dump"
    mkdir -m 777 "$pkgdir/opt/splashtop-business/log"
}
