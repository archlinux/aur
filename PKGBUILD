# Maintainer: GCMarvin <GCMarvin@users.noreply.github.com>
pkgname='ryujinx-ldn-bin'
pkgver='1.0.0_ldn2.4'
pkgrel='1'
pkgdesc='Experimental Nintendo Switch Emulator written in C# (LDN build)'
arch=('x86_64')
url='https://www.patreon.com/ryujinx'
license=('MIT')
depends=('dotnet-runtime>=5')
provides=('Ryujinx')
conflicts=('ryujinx-git')
options=('!strip')
source=('https://www.patreon.com/file?h=45268370&i=9248979'
        'https://github.com/Ryujinx/Ryujinx/raw/master/Ryujinx/Ryujinx.ico'
        'ryujinx.desktop')
sha256sums=('b5113e59b86776488f0aa188b2cfa6f1aab45148e0465fd1aee771c22e109adb'
            'c6063c96dc0cf44dd38b7c14b14cc77ed49ad53b925ea7d7ccf08754eb6e52da'
            '4ae3ce44129090ff08750a65edb2608a97afde94a97a6278ff901a3b56768bbb')

package() {
    install -d "${pkgdir}/usr/bin/"
    install -dm777 "${pkgdir}/opt/${pkgname}/Logs/"
    install -Dt "${pkgdir}/opt/${pkgname}/" "${srcdir}/"{"publish/"*,"Ryujinx.ico"}
    install -Dt "${pkgdir}/usr/share/applications/" "${srcdir}/ryujinx.desktop"
    ln -s "/opt/${pkgname}/Ryujinx" "${pkgdir}/usr/bin"
}
