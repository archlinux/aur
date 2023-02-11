# Maintainer: GCMarvin <GCMarvin@users.noreply.github.com>
pkgname='ryujinx-ldn-bin'
pkgver='1.1.0_ldn3.0.2'
pkgrel='1'
pkgdesc='Experimental Nintendo Switch Emulator written in C# (LDN build)'
arch=('x86_64')
url='https://www.patreon.com/ryujinx'
license=('MIT')
depends=('dotnet-runtime>=5')
provides=('Ryujinx')
conflicts=('ryujinx-git')
options=('!strip')
source=('https://www.patreon.com/file?h=74910544&i=13077867'
        'https://github.com/Ryujinx/Ryujinx/raw/master/Ryujinx/Ryujinx.ico'
        'ryujinx.desktop')
noextract=('Ryujinx.tar.gz')
b2sums=('eac5189ed2decabd26de9c6779c8e17768516649b4988295d70c34d387bc6342e84b2e71cdb391642b9f00ae6b32d51b6d8fc547ff694b3971c8bee2943c2b14'
        '2c092c895b0fb9ea5214fa9366264801c885d8a3f68cf8aa08b66b2c561b976e6000a9eb94080cceb23d5a69cfbc9eebf80cf8a21d0ae7bb060a32947028b698'
        '8fc955529929a4193c883571481a311b417f502a93fb42c22a2285ed2964895d16d2974f888ff3c46b28b659e44632c1bebc9cb7172bfe2d1fad3459948be89a')

package() {
    install -d "${pkgdir}/usr/bin/"
    install -dm777 "${pkgdir}/opt/${pkgname}/Logs/"
    install -Dm644 -t "${pkgdir}/opt/${pkgname}/" "${srcdir}/Ryujinx.ico"
    install -Dm644 -t "${pkgdir}/usr/share/applications/" "${srcdir}/ryujinx.desktop"
    cp -r "${srcdir}/publish/"* "${pkgdir}/opt/${pkgname}/"
    ln -s "/opt/${pkgname}/Ryujinx" "${pkgdir}/usr/bin"
}
