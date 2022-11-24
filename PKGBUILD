# Maintainer: GCMarvin <GCMarvin@users.noreply.github.com>
pkgname='ryujinx-ldn-bin'
pkgver='1.1.0_ldn3.0.1'
pkgrel='1'
pkgdesc='Experimental Nintendo Switch Emulator written in C# (LDN build)'
arch=('x86_64')
url='https://www.patreon.com/ryujinx'
license=('MIT')
depends=('dotnet-runtime>=5')
provides=('Ryujinx')
conflicts=('ryujinx-git')
options=('!strip')
source=('https://www.patreon.com/file?h=74910544&i=12353055'
        'https://github.com/Ryujinx/Ryujinx/raw/master/Ryujinx/Ryujinx.ico'
        'ryujinx.desktop')
noextract=('Ryujinx.tar.gz')
b2sums=('c4125babb1f0ff7f9c03dad255d12efbf3b07161cf08a9aabdbd75c5ae6b95473c46c1637361f2fd8f011e394aa80aedc8a34a3521e73e34fab0bc719acf8af6'
        '2c092c895b0fb9ea5214fa9366264801c885d8a3f68cf8aa08b66b2c561b976e6000a9eb94080cceb23d5a69cfbc9eebf80cf8a21d0ae7bb060a32947028b698'
        '8fc955529929a4193c883571481a311b417f502a93fb42c22a2285ed2964895d16d2974f888ff3c46b28b659e44632c1bebc9cb7172bfe2d1fad3459948be89a')

package() {
    install -d "${pkgdir}/usr/bin/"
    install -dm777 "${pkgdir}/opt/${pkgname}/Logs/"
    install -Dt "${pkgdir}/opt/${pkgname}/" "${srcdir}/publish/"* "${srcdir}/Ryujinx.ico"
    install -Dm644 -t "${pkgdir}/usr/share/applications/" "${srcdir}/ryujinx.desktop"
    ln -s "/opt/${pkgname}/Ryujinx" "${pkgdir}/usr/bin"
}
