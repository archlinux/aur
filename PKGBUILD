# Maintainer: Jan Dvorak <(firstname).(lastname) @ dvorak-sw.com>
pkgname=nconvert-bin
_pkgname=nconvert
pkgver=7.221
pkgrel=1
epoch=
pkgdesc="Command line batch image processor and converter from XnSoft."
arch=('i686' 'x86_64')
url="https://www.xnview.com/en/nconvert/"
license=('LicenseRef-custom')
depends=('libwebp' 'gcc-libs' 'glibc')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source_i686=('https://download.xnview.com/NConvert-linux.tgz')
source_x86_64=('https://download.xnview.com/NConvert-linux64.tgz')
sha256sums_i686=('5e8364bdc1fe61d2c37871e0591ddc2048ccf0cd8041846b433ef04f10280cba')
sha256sums_x86_64=('227e5568d09066c5955165d57ac7f0036b50848c40d1f21203ab984ce3b75612')
package() {
    cd NConvert
    install -d "${pkgdir}/opt/NConvert"
    install -d "${pkgdir}/opt/NConvert/Plugins"
    install -d "${pkgdir}/usr/bin"

    install -m 755 -D nconvert "${pkgdir}/opt/NConvert/nconvert"
    install -m 644 -D license.txt "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
    install -m 644 -D {Formats.txt,Plugins.txt,ReadMe.txt,Usage.txt,WhatsNew.txt} -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -m 644 Plugins/{libbrotlicommon.so,libbrotlidec.so,libbrotlienc.so,libIex-3_2.so,libIlmThread-3_2.so,libImath-3_2.so,libJPEGXL.so,libjxl_cms.so.0.11,libjxl_threads.so.0.11,libjxl.so.0.11,libOpenEXR.so,libOpenEXRCore-3_2.so,libOpenEXRUtil-3_2.so,libwebp.so.7.1.10,libwebpdecoder.so.3.1.10,libwebpdemux.so.2.0.16,libwebpmux.so.3.1.1,openjp2.so} -t "${pkgdir}/opt/NConvert/Plugins"
    install -m 755 Plugins/libsharpyuv.so.0.1.1 "${pkgdir}/opt/NConvert/Plugins/libsharpyuv.so.0.1.1"

    ln -sf /opt/NConvert/nconvert "${pkgdir}/usr/bin/nconvert"
    ln -sf "./libbrotlicommon.so" "${pkgdir}/opt/NConvert/Plugins/libbrotlicommon.so.1"
    ln -sf "./libbrotlidec.so" "${pkgdir}/opt/NConvert/Plugins/libbrotlidec.so.1"
    ln -sf "./libbrotlienc.so" "${pkgdir}/opt/NConvert/Plugins/libbrotlienc.so.1"
    ln -sf "./libIex-3_2.so" "${pkgdir}/opt/NConvert/Plugins/libIex-3_2.so.29"
    ln -sf "./libIlmThread-3_2.so" "${pkgdir}/opt/NConvert/Plugins/libIlmThread-3_2.so.29"
    ln -sf "./libImath-3_2.so" "${pkgdir}/opt/NConvert/Plugins/libImath-3_2.so.29" 
    ln -sf "./libwebp.so.7.1.10" "${pkgdir}/opt/NConvert/Plugins/libwebp.so.7"
    ln -sf "./libwebp.so.7" "${pkgdir}/opt/NConvert/Plugins/libwebp.so"  
    ln -sf "./libwebpdecoder.so.3.1.10" "${pkgdir}/opt/NConvert/Plugins/libwebpdecoder.so.3"
    ln -sf "./libwebpdecoder.so.3" "${pkgdir}/opt/NConvert/Plugins/libwebpdecoder.so"
    ln -sf "./libwebpdemux.so.2.0.16" "${pkgdir}/opt/NConvert/Plugins/libwebpdemux.so.2"
    ln -sf "./libwebpdemux.so.2" "${pkgdir}/opt/NConvert/Plugins/libwebpdemux.so"
    ln -sf "./libwebpmux.so.3.1.1" "${pkgdir}/opt/NConvert/Plugins/libwebpmux.so.3"
    ln -sf "./libwebpmux.so.3" "${pkgdir}/opt/NConvert/Plugins/libwebpmux.so"
}
