#Maintainer: Skykey <zcxzxlc@163.com>

pkgname=('tradermaster')
pkgver=3.0.0
pkgrel=1
pkgdesc="超强行情分析软件"
provides=("tradermaster")
url='http://jiaoyixia.com'
arch=('x86_64')
depends=('brotli' 'libbsd' 'libssh' 'sqlite' 'rtmpdump' 'gnutls' 'glfw-x11' 'glew' 'fontconfig' 'freetype2' 'libzip')
source=("${pkgname}.deb::https://cdn.jin10.com/linuxclient/TraderMaster_20_04.deb"
)
sha512sums=('9846035301fd6fe7298ee26686c74fefe5ebe6fc15b967ab26ee3cd98c0645f4ea3443411eb324f2a0df302e758548a150fb06755e634a631fb5fdf363827d39'
)

package(){
	 cd ${srcdir}
	 tar -xJvf data.tar.xz -C "${pkgdir}"

	 install -Dm755 "${pkgdir}"/usr/bin/TraderMaster/TraderMaster "${pkgdir}"/opt/TraderMaster/TraderMaster
	 install -Dm755 "${pkgdir}"/usr/bin/TraderMaster/run.sh "${pkgdir}"/opt/TraderMaster/run.sh
	 
        	 sed -i 's|/usr/bin/TraderMaster|/usr/lib/TraderMaster|g' "${pkgdir}"/opt/TraderMaster/run.sh
                         sed -i 's|/usr/lib/TraderMaster/TraderMaster|/opt/TraderMaster/TraderMaster|g' "${pkgdir}"/opt/TraderMaster/run.sh
	 sed -i 's|/usr/bin/TraderMaster|/opt/TraderMaster|g' "${pkgdir}"/usr/share/applications/TraderMaster.desktop

	 install -Dm755 "${pkgdir}"/usr/bin/TraderMaster/libGLEW.so.2.1 "${pkgdir}"/usr/lib/TraderMaster/libGLEW.so.2.1
	 install -Dm755 "${pkgdir}"/usr/bin/TraderMaster/libfmod.so.6 "${pkgdir}"/usr/lib/TraderMaster/libfmod.so.6
	 install -Dm755 "${pkgdir}"/usr/bin/TraderMaster/libasn1.so.8 "${pkgdir}"/usr/lib/TraderMaster/libasn1.so.8
	 install -Dm755 "${pkgdir}"/usr/bin/TraderMaster/libgssapi.so.3 "${pkgdir}"/usr/lib/TraderMaster/libgssapi.so.3
	 install -Dm755 "${pkgdir}"/usr/bin/TraderMaster/libhcrypto.so.4 "${pkgdir}"/usr/lib/TraderMaster/libhcrypto.so.4
	 install -Dm755 "${pkgdir}"/usr/bin/TraderMaster/libheimbase.so.1 "${pkgdir}"/usr/lib/TraderMaster/libheimbase.so.1
	 install -Dm755 "${pkgdir}"/usr/bin/TraderMaster/libheimntlm.so.0 "${pkgdir}"/usr/lib/TraderMaster/libheimntlm.so.0
	 install -Dm755 "${pkgdir}"/usr/bin/TraderMaster/libhogweed.so.5 "${pkgdir}"/usr/lib/TraderMaster/libhogweed.so.5
	 install -Dm755 "${pkgdir}"/usr/bin/TraderMaster/libhx509.so.5 "${pkgdir}"/usr/lib/TraderMaster/libhx509.so.5
	 install -Dm755 "${pkgdir}"/usr/bin/TraderMaster/libnettle.so.7 "${pkgdir}"/usr/lib/TraderMaster/libnettle.so.7
	 install -Dm755 "${pkgdir}"/usr/bin/TraderMaster/libroken.so.18 "${pkgdir}"/usr/lib/TraderMaster/libroken.so.18
	 install -Dm755 "${pkgdir}"/usr/bin/TraderMaster/libsasl2.so.2 "${pkgdir}"/usr/lib/TraderMaster/libsasl2.so.2
	 install -Dm755 "${pkgdir}"/usr/bin/TraderMaster/libstdc++.so.6 "${pkgdir}"/usr/lib/TraderMaster/libstdc++.so.6
	 install -Dm755 "${pkgdir}"/usr/bin/TraderMaster/libwind.so.0 "${pkgdir}"/usr/lib/TraderMaster/libwind.so.0
	 
	 install -Dm644 "${pkgdir}"/usr/bin/TraderMaster/Resources/res.ext "${pkgdir}"/opt/TraderMaster/Resources/res.ext
	 
	 rm -rf "${pkgdir}"/usr/bin
	 
	 chmod 0755 "${pkgdir}"/usr
	 chmod -R 0755 "${pkgdir}"/usr/share
	 
	 
	 
	 
	 
}