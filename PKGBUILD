# Maintainer: GCMarvin <GCMarvin@users.noreply.github.com>
pkgname='ryujinx-ldn-bin'
pkgver='1.0.0_ldn2.1'
pkgrel='1'
pkgdesc='Experimental Nintendo Switch Emulator written in C# (LDN build)'
arch=('x86_64')
url='https://www.patreon.com/ryujinx'
license=('MIT')
depends=('dotnet-runtime>=5')
provides=('Ryujinx')
conflicts=('ryujinx-git')
options=('staticlibs')
source=('https://www.patreon.com/file?h=45268370&i=7206532'
        'https://github.com/Ryujinx/Ryujinx/raw/master/Ryujinx/Ryujinx.ico')
sha256sums=('a20929730011f3a8cad7fc991daf6a824f94ea13a14f0b1c0f1a7f9a9765650b'
            'c6063c96dc0cf44dd38b7c14b14cc77ed49ad53b925ea7d7ccf08754eb6e52da')

package() {
    install -d "${pkgdir}/usr/"{"bin","share/applications"}
    install -Dt "${pkgdir}/opt/${pkgname}" "${srcdir}/"{"publish/"*,"Ryujinx.ico"}
    install -dm777 "${pkgdir}/opt/${pkgname}/Logs"
    ln -s "/opt/${pkgname}/Ryujinx" "${pkgdir}/usr/bin"
    echo "[Desktop Entry]
Type=Application
Encoding=UTF-8
Name=Ryujinx
Comment=${pkgdesc}
Exec=Ryujinx
Icon=/opt/${pkgname}/Ryujinx.ico
Terminal=false
Categories=Game;" >> "${pkgdir}/usr/share/applications/ryujinx.desktop"
}
