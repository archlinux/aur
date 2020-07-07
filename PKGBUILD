#Maintainer: Skykey <zcxzxlc@163.com>

pkgname=('clashy-bin')
pkgver=0.1.16
pkgrel=1
pkgdesc="A GUI proxy client for Windows / Mac / Ubuntu Desktop based on Clash and Electron. Windows / Mac / Ubuntu 适用的Clash客户端."
provides=("clashy")
url='https://github.com/SpongeNobody/Clashy'
arch=('x86_64')
depends=('libnotify' 'nss' 'libxss' 'xdg-utils' 'libutil-linux' 'libappindicator-gtk3' 'libsecret' 'gobject-introspection-runtime' 'ffmpeg')
source=("https://github.com/SpongeNobody/Clashy/releases/download/v0.1.16/Clashy_0.1.16_amd64.deb"
)
md5sums=('5fd3bccf1ebd5b11f6c0a9b7e9c13519'
)
license=()

package(){
	 cd ${srcdir}
	 tar -xJvf data.tar.xz -C "${pkgdir}"
    
     install -Dm644 "${pkgdir}"/usr/share/icons/hicolor/0x0/apps/clashy.png "${pkgdir}"/usr/share/icons/clashy.png
    
	 rm -rf "${pkgdir}"/opt/Clashy/libEGL.so
	 rm -rf "${pkgdir}"/opt/Clashy/libGLESv2.so
	 
	 mkdir -p "${pkgdir}"/usr/bin
	 ln -s /opt/Clashy/clashy "${pkgdir}"/usr/bin/clashy
}
