# Maintainer: Zack Emmert <zemmert@fastmail.com>

pkgname=memtypetool-bin
_pkgname=memtypetool
pkgver=1.0.1
pkgrel=2
pkgdesc="GUI Tool for the MemType Hardware Password Manager (Binary version)"
arch=('x86_64')
url="http://www.area0x33.com/documentation/memtype.html"
license=('GPL')
groups=()
depends=('qt5-base' 'libusb')
source=("https://github.com/oyzzo/MemTypeTool/releases/download/${pkgver}/MemTypeTool-${pkgver}-linux_x64.tar.gz"
        "https://raw.githubusercontent.com/oyzzo/MemTypeTool/${pkgver}/99-MemType.rules"
        "memtypetool.desktop"
        "logo.png")
sha256sums=('ca65ad73a892701412235994a1c572e5e3e8f20ed3bd5ea00a054b5c1d009820' 
            'c580b99ceaa390283c7d017e9d88cb8135288f1263ba97cf19264b5f979cc1b6'
            'f702c15b4a52820b021f1bbc7c8546fb7fea5462a9ff3f4c42baadfd8483bf9f'
            '1486f05b848bd5c45069dd21d88a0a2872e9be3361c37380146cedaae7b0964c')

package() {
	
	install -d "${pkgdir}/opt/${_pkgname}"
	install -d "${pkgdir}/usr/share/applications"
	install -d "${pkgdir}/usr/bin"
	install -d "${pkgdir}/etc/udev/rules.d"
	
	install logo.png "${pkgdir}/opt/${_pkgname}"
	install memtypetool.desktop "${pkgdir}/usr/share/applications"
    install 99-MemType.rules "${pkgdir}/etc/udev/rules.d"
    
	cd "${srcdir}"
	install linux64/* "${pkgdir}/opt/${_pkgname}/"
	ln -s "/opt/${_pkgname}/MemTypeManager" "${pkgdir}/usr/bin/MemTypeManager"
}
