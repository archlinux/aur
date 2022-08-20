# Maintainer: GCMarvin <GCMarvin@users.noreply.github.com>
pkgname='ryujinx-ldn-bin'
pkgver='1.1.0_ldn2.5'
pkgrel='1'
pkgdesc='Experimental Nintendo Switch Emulator written in C# (LDN build)'
arch=('x86_64')
url='https://www.patreon.com/ryujinx'
license=('MIT')
depends=('dotnet-runtime>=5')
provides=('Ryujinx')
conflicts=('ryujinx-git')
options=('!strip')
source=('Ryujinx.tar.gz::https://www.patreon.com/file?h=70757628&i=11545814'
        'https://github.com/Ryujinx/Ryujinx/raw/master/Ryujinx/Ryujinx.ico'
        'ryujinx.desktop')
noextract=('Ryujinx.tar.gz')
sha256sums=('cd4a0085dde322ddb0dfd825b5e03d2d2e839a8a04cbe604bbfd89a29903e9db'
            'c6063c96dc0cf44dd38b7c14b14cc77ed49ad53b925ea7d7ccf08754eb6e52da'
            '388cf563802c6721896ccc47cfa0b590b5e3eaf7a2e851810308af1ab849bab4')

package() {
    install -d "${pkgdir}/usr/bin/"
    install -dm777 "${pkgdir}/opt/${pkgname}/Logs/"
    tar -xf "${srcdir}/Ryujinx.tar.gz" -C "${pkgdir}/opt/${pkgname}/"
    install -Dt "${pkgdir}/opt/${pkgname}/" "${srcdir}/Ryujinx.ico"
    install -Dt "${pkgdir}/usr/share/applications/" "${srcdir}/ryujinx.desktop"
    ln -s "/opt/${pkgname}/Ryujinx" "${pkgdir}/usr/bin"
}
