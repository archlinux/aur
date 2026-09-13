# Maintainer: Jan Dvorak <(firstname).(lastname) @ dvorak-sw.com>
pkgname=nconvert-bin
_pkgname=nconvert
pkgver=7.300
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
sha256sums_x86_64=('e54276c9f5cdde8836d2732eae14d35e536b6315887ed71494f65f1e4a2f7c14')
package() {
    cd NConvert
    install -d "${pkgdir}/opt/NConvert"
    install -d "${pkgdir}/opt/NConvert/Plugins"
    install -d "${pkgdir}/usr/bin"

    install -m 755 -D nconvert "${pkgdir}/opt/NConvert/nconvert"
    install -m 644 -D license.txt "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
    install -m 644 -D {Formats.txt,ReadMe.txt,Usage.txt,WhatsNew.txt} -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -m 644 Plugins/{libaom.so.3.13.1,libavif.so,libbrotlicommon.so.1.2.0,libbrotlidec.so.1.2.0,libbrotlienc.so.1.2.0,libde265.so.0.2.1,libheif.so.1.23.1,libIex-3_4.so.33.3.4.10,libIlmThread-3_4.so.33.3.4.10,libImath-3_2.so.30.3.2.2,libjxl_cms.so.0.12.0,libjxl_threads.so.0.12.0,libjxl.so.0.12.0,libOpenEXR-3_4.so.33.3.4.10,libOpenEXRCore-3_4.so.33.3.4.10,libOpenEXRUtil-3_4.so.33.3.4.10,libsharpyuv.so.0.1.2,libwebp.so.7.2.0,libwebpdecoder.so.3.2.0,libwebpdemux.so.2.0.17,libwebpmux.so.3.1.2,libx265.so.215,openjp2.so} -t "${pkgdir}/opt/NConvert/Plugins"                    
    install -m 755 Plugins/libJPEGXL.so "${pkgdir}/opt/NConvert/Plugins/libJPEGXL.so"
    install -m 755 Plugins/libdav1d.so.7.0.0 "${pkgdir}/opt/NConvert/Plugins/libdav1d.so.7.0.0"

    ln -sf /opt/NConvert/nconvert "${pkgdir}/usr/bin/nconvert"
    ln -sf "./libaom.so.3.13.1" "${pkgdir}/opt/NConvert/Plugins/libaom.so.3"
    ln -sf "./libaom.so.3" "${pkgdir}/opt/NConvert/Plugins/libaom.so"  
    ln -sf "./libbrotlicommon.so.1.2.0" "${pkgdir}/opt/NConvert/Plugins/libbrotlicommon.so.1"
    ln -sf "./libbrotlicommon.so.1" "${pkgdir}/opt/NConvert/Plugins/libbrotlicommon.so"   
    ln -sf "./libbrotlidec.so.1.2.0" "${pkgdir}/opt/NConvert/Plugins/libbrotlidec.so.1"
    ln -sf "./libbrotlidec.so.1" "${pkgdir}/opt/NConvert/Plugins/libbrotlidec.so"
    ln -sf "./libbrotlienc.so.1.2.0" "${pkgdir}/opt/NConvert/Plugins/libbrotlienc.so.1"
    ln -sf "./libbrotlienc.so.1" "${pkgdir}/opt/NConvert/Plugins/libbrotlienc.so"
    ln -sf "./libdav1d.so.7.0.0" "${pkgdir}/opt/NConvert/Plugins/libdav1d.so.7"
    ln -sf "./libdav1d.so.7" "${pkgdir}/opt/NConvert/Plugins/libdav1d.so"
    ln -sf "./libde265.so.0.2.1" "${pkgdir}/opt/NConvert/Plugins/libde265.so.0"
    ln -sf "./libde265.so.0" "${pkgdir}/opt/NConvert/Plugins/libde265.so"
    ln -sf "./libheif.so.1.23.1" "${pkgdir}/opt/NConvert/Plugins/libheif.so.1"
    ln -sf "./libheif.so.1" "${pkgdir}/opt/NConvert/Plugins/libheif.so"
    ln -sf "./libIex-3_4.so.33.3.4.10" "${pkgdir}/opt/NConvert/Plugins/libIex-3_4.so.33"
    ln -sf "./libIex-3_4.so.33" "${pkgdir}/opt/NConvert/Plugins/libIex-3_4.so"
    ln -sf "./libIex-3_4.so" "${pkgdir}/opt/NConvert/Plugins/libIex.so"
    ln -sf "./libIlmThread-3_4.so.33.3.4.10" "${pkgdir}/opt/NConvert/Plugins/libIlmThread-3_4.so.33"
    ln -sf "./libIlmThread-3_4.so.33" "${pkgdir}/opt/NConvert/Plugins/libIlmThread-3_4.so"
    ln -sf "./libIlmThread-3_4.so" "${pkgdir}/opt/NConvert/Plugins/libIlmThread.so"
    ln -sf "./libImath-3_2.so.30.3.2.2" "${pkgdir}/opt/NConvert/Plugins/libImath-3_2.so.30"
    ln -sf "./libImath-3_2.so.30" "${pkgdir}/opt/NConvert/Plugins/libImath-3_2.so"
    ln -sf "./libImath-3_2.so" "${pkgdir}/opt/NConvert/Plugins/libImath.so"
    ln -sf "./libjxl_cms.so.0.12.0" "${pkgdir}/opt/NConvert/Plugins/libjxl_cms.so.0.12"
    ln -sf "./libjxl_cms.so.0.12" "${pkgdir}/opt/NConvert/Plugins/libjxl_cms.so"
    ln -sf "./libjxl_threads.so.0.12.0" "${pkgdir}/opt/NConvert/Plugins/libjxl_threads.so.0.12"
    ln -sf "./libjxl_threads.so.0.12" "${pkgdir}/opt/NConvert/Plugins/libjxl_threads.so"
    ln -sf "./libjxl.so.0.12.0" "${pkgdir}/opt/NConvert/Plugins/libjxl.so.0.12"
    ln -sf "./libjxl.so.0.12" "${pkgdir}/opt/NConvert/Plugins/libjxl.so"
    ln -sf "./libOpenEXR-3_4.so.33.3.4.10" "${pkgdir}/opt/NConvert/Plugins/libOpenEXR-3_4.so.33"
    ln -sf "./libOpenEXR-3_4.so.33" "${pkgdir}/opt/NConvert/Plugins/libOpenEXR-3_4.so"
    ln -sf "./libOpenEXR-3_4.so" "${pkgdir}/opt/NConvert/Plugins/libOpenEXR.so"
    ln -sf "./libOpenEXRCore-3_4.so.33.3.4.10" "${pkgdir}/opt/NConvert/Plugins/libOpenEXRCore-3_4.so.33"
    ln -sf "./libOpenEXRCore-3_4.so.33" "${pkgdir}/opt/NConvert/Plugins/libOpenEXRCore-3_4.so"
    ln -sf "./libOpenEXRCore-3_4.so" "${pkgdir}/opt/NConvert/Plugins/libOpenEXRCore.so"
    ln -sf "./libOpenEXRUtil-3_4.so.33.3.4.10" "${pkgdir}/opt/NConvert/Plugins/libOpenEXRUtil-3_4.so.33"
    ln -sf "./libOpenEXRUtil-3_4.so.33" "${pkgdir}/opt/NConvert/Plugins/libOpenEXRUtil-3_4.so"
    ln -sf "./libOpenEXRUtil-3_4.so" "${pkgdir}/opt/NConvert/Plugins/libOpenEXRUtil.so"
    ln -sf "./libsharpyuv.so.0.1.2" "${pkgdir}/opt/NConvert/Plugins/libsharpyuv.so.0"
    ln -sf "./libsharpyuv.so.0" "${pkgdir}/opt/NConvert/Plugins/libsharpyuv.so"
    ln -sf "./libwebp.so.7.2.0" "${pkgdir}/opt/NConvert/Plugins/libwebp.so.7"
    ln -sf "./libwebp.so.7" "${pkgdir}/opt/NConvert/Plugins/libwebp.so"
    ln -sf "./libwebpdecoder.so.3.2.0" "${pkgdir}/opt/NConvert/Plugins/libwebpdecoder.so.3"
    ln -sf "./libwebpdecoder.so.3" "${pkgdir}/opt/NConvert/Plugins/libwebpdecoder.so"
    ln -sf "./libwebpdemux.so.2.0.17" "${pkgdir}/opt/NConvert/Plugins/libwebpdemux.so.2"
    ln -sf "./libwebpdemux.so.2" "${pkgdir}/opt/NConvert/Plugins/libwebpdemux.so"
    ln -sf "./libwebpmux.so.3.1.2" "${pkgdir}/opt/NConvert/Plugins/libwebpmux.so.3"
    ln -sf "./libwebpmux.so.3" "${pkgdir}/opt/NConvert/Plugins/libwebpmux.so"
    ln -sf "./libx265.so.215" "${pkgdir}/opt/NConvert/Plugins/libx265.so"    
}
