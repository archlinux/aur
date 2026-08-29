# Maintainer: Cody Wyatt Neiman (xangelix) <neiman@cody.to>

pkgname=kasmvncserver-bin
pkgver="1.5.0"
pkgrel=1
pkgdesc="KasmVNC provides remote web-based access to a Desktop or application."
arch=('x86_64' 'aarch64')
url="https://github.com/kasmtech/KasmVNC"
license=('GPL2')
depends=('ca-certificates-utils' 'freetype2>=2.2.1' 'libbsd>=0.7.0' 'libglvnd' 'libpng>=1.6.2' 'libunwind' 'libx11>=1.4.99.1' 'libxau>=1.0.9' 'libxcrypt-compat>=4.1.0' 'libxcursor>1.1.2' 'libxdmcp' 'libxext' 'libxfixes' 'libxfont2>=2.0.1' 'libxrandr>=1.2.0' 'libxshmfence' 'libxtst' 'mesa' 'openssl-1.1' 'perl' 'perl-datetime' 'perl-datetime-timezone' 'perl-hash-merge-simple' 'perl-list-moreutils' 'perl-switch' 'perl-try-tiny' 'perl-yaml-tiny' 'pixman>=0.30.0' 'systemd-libs' 'xkeyboard-config' 'xorg-xauth' 'xorg-xkbutils' 'zlib')
backup=('etc/kasmvnc/kasmvnc.yaml')
options=('!strip' '!emptydirs')

source_x86_64=("https://github.com/kasmtech/KasmVNC/releases/download/v${pkgver}/kasmvncserver_focal_${pkgver}_amd64.deb")
source_aarch64=("https://github.com/kasmtech/KasmVNC/releases/download/v${pkgver}/kasmvncserver_focal_${pkgver}_arm64.deb")

sha512sums_x86_64=('b46c20d1b5438efa9d3e465b99aa930842dd562ea4fff9629c3174678df8607b16bb7e48bffe71ebf2d991eb6591c224d34ade5e7c0779777445ad6435ca40ca')
sha512sums_aarch64=('9aff03496e94b14e8a6e5714c986b337b038ee6da459782bfcb2cc272f96185076626a8b6ceda396268b30291c21f97eb4f58ce9b99505e7c728191f1a65542d')

package(){
        # Extract package data
        tar -xJf data.tar.xz -C "${pkgdir}"

        mkdir -p ${pkgdir}/usr/share/perl5/vendor_perl/
        mv ${pkgdir}/usr/share/perl5/KasmVNC ${pkgdir}/usr/share/perl5/vendor_perl/KasmVNC

        ln -s /usr/bin/kasmvncserver ${pkgdir}/usr/bin/vncserver
        ln -s /usr/bin/kasmvncpasswd ${pkgdir}/usr/bin/vncpasswd
        ln -s /usr/bin/kasmvncconfig ${pkgdir}/usr/bin/vncconfig
        ln -s /usr/bin/Xkasmvnc ${pkgdir}/usr/bin/Xvnc
        ln -s /usr/bin/kasmxproxy ${pkgdir}/usr/bin/xproxy
}
