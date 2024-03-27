# Maintainer: Andrew Simmons <agsimmons0 at gmail dot com>
# Contributor:: Tab Fitts <tfitts [at] spryservers [dot] net>

pkgname=splashtop-business
pkgver=3.6.4.0
pkgrel=1
pkgdesc="Splashtop Business. Remotely access your desktop from any device from anywhere!"
arch=('x86_64')
url="https://www.splashtop.com/business"
license=('Proprietary')
depends=('curl>=7.47.0' 'ffmpeg' 'gcc>=3.0' 'hicolor-icon-theme' 'keyutils>=1.5.6' 'libpulse' 'libxcb>=1.3' 'qt5-base>=5.5.0' 'gtk3>=3.5.12' 'gdk-pixbuf2' 'tracker3-docs' 'util-linux-libs' 'xcb-util>=0.4.0' 'xcb-util-keysyms>=0.4.0' 'binutils' 'libxrandr' 'libxfixes' 'uriparser')
optdepends=('bash-completion: Bash completion support')
provides=('splashtop-business')
options=('!strip')
install=${pkgname}.install
source=("https://download.splashtop.com/linuxclient/${pkgname}_Ubuntu_v${pkgver}_amd64.tar.gz")
sha256sums=('fdec35ed85555ae060508a89e9bec6c008ba4d7e65102f17b287cdd0dc5d97bb')

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
