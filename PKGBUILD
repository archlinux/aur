#Maintainer: Skykey <zcxzxlc@163.com>

pkgname=('clashy-bin')
pkgver=0.1.17
pkgrel=1
pkgdesc="A GUI proxy client for Windows / Mac / Ubuntu Desktop based on Clash and Electron. Windows / Mac / Ubuntu 适用的Clash客户端."
provides=("clashy")
url='https://github.com/SpongeNobody/Clashy'
arch=('x86_64')
depends=('libnotify' 'nss' 'libxss' 'xdg-utils' 'libappindicator-gtk3' 'libsecret' 'gobject-introspection-runtime' 'ffmpeg')
source=("https://github.com/SpongeNobody/Clashy/releases/download/v0.1.17/Clashy_0.1.17_amd64.deb"
)
md5sums=('73fa5c0700658fb44866808d5fcc4080'
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
