#Maintainer: Skykey <zcxzxlc@163.com>

pkgname=('tradermaster')
pkgver=3.0.0
pkgrel=1
pkgdesc="超强行情分析软件"
provides=("tradermaster")
url='http://jiaoyixia.com/'
arch=('x86_64')
depends=('brotli' 'libbsd' 'glibc' 'zlib' 'libxdmcp' 'libxau' 'libx11' 'libutil-linux' 'libunistring' 'libtasn1' 'libssh' 'sqlite' 'e2fsprogs' 'rtmpdump' 'libpsl' 'libnghttp2' 'libp11-kit' 'libidn2' 'keyutils' 'libldap' 'gmp' 'gnutls' 'krb5' 'libglvnd' 'gcc-libs' 'libffi' 'expat' 'glfw-x11' 'glew'  'fontconfig'  'freetype2'  'libzip' 'libpng' 'curl' 'openssl' 'libxcb')
source=("${pkgname}.deb::https://cdn.jin10.com/linuxclient/TraderMaster_20_04.deb")
sha512sums=('9846035301fd6fe7298ee26686c74fefe5ebe6fc15b967ab26ee3cd98c0645f4ea3443411eb324f2a0df302e758548a150fb06755e634a631fb5fdf363827d39')

package(){
        cd ${srcdir}
        tar -xJvf data.tar.xz -C "${pkgdir}"
        
        # bin
        mkdir -p "${pkgdir}"/opt/TraderMaster
        mv "${pkgdir}"/usr/bin/TraderMaster/TraderMaster "${pkgdir}"/opt/TraderMaster/TraderMaster
        mv "${pkgdir}"/usr/bin/TraderMaster/run.sh "${pkgdir}"/opt/TraderMaster/run.sh
        
        
        # libs
        mkdir -p "${pkgdir}"/usr/lib/TraderMaster
        mv "${pkgdir}"/usr/bin/TraderMaster/libGLEW.so.2.1 "${pkgdir}"/usr/lib/TraderMaster/libGLEW.so.2.1
        mv "${pkgdir}"/usr/bin/TraderMaster/libfmod.so.6 "${pkgdir}"/usr/lib/TraderMaster/libfmod.so.6
        mv "${pkgdir}"/usr/bin/TraderMaster/libasn1.so.8 "${pkgdir}"/usr/lib/TraderMaster/libasn1.so.8
        mv "${pkgdir}"/usr/bin/TraderMaster/libgssapi.so.3 "${pkgdir}"/usr/lib/TraderMaster/libgssapi.so.3
        mv "${pkgdir}"/usr/bin/TraderMaster/libhcrypto.so.4 "${pkgdir}"/usr/lib/TraderMaster/libhcrypto.so.4
        mv "${pkgdir}"/usr/bin/TraderMaster/libheimbase.so.1 "${pkgdir}"/usr/lib/TraderMaster/libheimbase.so.1
        mv "${pkgdir}"/usr/bin/TraderMaster/libheimntlm.so.0 "${pkgdir}"/usr/lib/TraderMaster/libheimntlm.so.0
        mv "${pkgdir}"/usr/bin/TraderMaster/libhogweed.so.5 "${pkgdir}"/usr/lib/TraderMaster/libhogweed.so.5       
        mv "${pkgdir}"/usr/bin/TraderMaster/libhx509.so.5 "${pkgdir}"/usr/lib/TraderMaster/libhx509.so.5
        mv "${pkgdir}"/usr/bin/TraderMaster/libnettle.so.7 "${pkgdir}"/usr/lib/TraderMaster/libnettle.so.7
        mv "${pkgdir}"/usr/bin/TraderMaster/libroken.so.18 "${pkgdir}"/usr/lib/TraderMaster/libroken.so.18        
        mv "${pkgdir}"/usr/bin/TraderMaster/libsasl2.so.2 "${pkgdir}"/usr/lib/TraderMaster/libsasl2.so.2
        mv "${pkgdir}"/usr/bin/TraderMaster/libstdc++.so.6 "${pkgdir}"/usr/lib/TraderMaster/libstdc++.so.6
        mv "${pkgdir}"/usr/bin/TraderMaster/libwind.so.0 "${pkgdir}"/usr/lib/TraderMaster/libwind.so.0
        
        
        sed -i 's|/usr/bin/TraderMaster|/usr/lib/TraderMaster|g' "${pkgdir}"/opt/TraderMaster/run.sh
       sed -i 's|/usr/lib/TraderMaster/TraderMaster|/opt/TraderMaster/TraderMaster|g' "${pkgdir}"/opt/TraderMaster/run.sh
       
        # resource
        mkdir -p "${pkgdir}"/opt/TraderMaster/Resources
        mv "${pkgdir}"/usr/bin/TraderMaster/Resources/* "${pkgdir}"/opt/TraderMaster/Resources/
       
       
       # desktop
       sed -i 's|/usr/bin/TraderMaster|/opt/TraderMaster|g' "${pkgdir}"/usr/share/applications/TraderMaster.desktop
       
        # chmod
        chmod -R 0755 "${pkgdir}"/opt
        chmod -R 0755 "${pkgdir}"/usr/
        
       # remove files
       rm -rf "${pkgdir}/usr/bin"

}
