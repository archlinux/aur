# Maintainer: Cody Wyatt Neiman (xangelix) <neiman@cody.to>

pkgname=kasmvncserver-bin
pkgver=1.3.3
pkgrel=1
pkgdesc="KasmVNC provides remote web-based access to a Desktop or application."
arch=('x86_64')
url="https://github.com/kasmtech/KasmVNC"
license=('GPL2')
depends=('ca-certificates-utils' 'libbsd>=0.7.0' 'libgl' 'libglvnd' 'libjpeg-turbo' 'libunwind' 'libx11>=1.4.99.1' 'libxau>=1.0.9' 'libxcrypt-compat>=4.1.0' 'libxcursor>1.1.2' 'libxdmcp' 'libxext' 'libxfixes' 'libxfont2>=2.0.1' 'libxrandr>=1.2.0' 'libxtst' 'libyaml' 'openssl>=3.0.0.alpha1' 'perl' 'perl-hash-merge-simple' 'perl-list-moreutils' 'perl-switch' 'perl-try-tiny' 'perl-yaml-tiny' 'pixman>=0.30.0' 'systemd-libs' 'xkeyboard-config' 'xorg-xauth' 'xorg-xkbutils' 'zlib>=1.1.4' 'perl-datetime' 'freetype2>=2.2.1' 'lib32-mesa' 'libpng>=1.6.2' 'libxshmfence')
backup=('etc/kasmvnc/kasmvnc.yaml')
options=('!strip' '!emptydirs')
source=("https://github.com/kasmtech/KasmVNC/releases/download/v${pkgver}/kasmvncserver_jammy_${pkgver}_amd64.deb")
sha512sums=('2e1e36f497ccd9a320ddf33325caf07784cc08e4c53b1f65d8688aa63fab2726043821b70186d25475224b8e3ffa4dddcf38ecf5886fcc3b053d600fad2a3c20')

package(){
        # Extract package data
        tar -xI unzstd -f data.tar.zst -C "${pkgdir}"

        mkdir ${pkgdir}/usr/share/perl5/vendor_perl/
        mv ${pkgdir}/usr/share/perl5/KasmVNC ${pkgdir}/usr/share/perl5/vendor_perl/KasmVNC

        ln -s /usr/bin/kasmvncserver ${pkgdir}/usr/bin/vncserver
        ln -s /usr/bin/kasmvncpasswd ${pkgdir}/usr/bin/vncpasswd
        ln -s /usr/bin/kasmvncconfig ${pkgdir}/usr/bin/vncconfig
        ln -s /usr/bin/Xkasmvnc ${pkgdir}/usr/bin/Xvnc
        ln -s /usr/bin/kasmxproxy ${pkgdir}/usr/bin/xproxy
}
