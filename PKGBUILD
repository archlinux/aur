# Maintainer: Cody Wyatt Neiman (xangelix) <neiman@cody.to>

pkgname=kasmvncserver-bin
pkgver=1.0.1
pkgrel=2
pkgdesc="KasmVNC provides remote web-based access to a Desktop or application."
arch=('x86_64')
url="https://github.com/kasmtech/KasmVNC"
license=('GPL2')
depends=('aarch64-linux-gnu-gcc>=11' 'ca-certificates-utils' 'libbsd>=0.7.0' 'libgl' 'libglvnd' 'libjpeg-turbo' 'libunwind' 'libx11>=1.4.99.1' 'libxau>=1.0.9' 'libxcrypt-compat>=4.1.0' 'libxcursor>1.1.2' 'libxdmcp' 'libxext' 'libxfixes' 'libxfont2>=2.0.1' 'libxrandr>=1.2.0' 'libxtst' 'libyaml' 'openssl>=3.0.0.alpha1' 'perl' 'perl-hash-merge-simple' 'perl-list-moreutils' 'perl-switch' 'perl-try-tiny' 'perl-yaml-tiny' 'pixman>=0.30.0' 'systemd-libs' 'xkeyboard-config' 'xorg-xauth' 'xorg-xkbutils' 'zlib>=1.1.4')
backup=('etc/kasmvnc/kasmvnc.yaml')
options=('!strip' '!emptydirs')
source=("https://github.com/kasmtech/KasmVNC/releases/download/v${pkgver}/kasmvncserver_jammy_${pkgver}_amd64.deb")
sha512sums=('d995ae1f4fec2e344c261e8dae7101bdc7a3cd4f8e6f99d100ebbbc314c1ded76311fb2262fac48ef3d2009eae05fbe85a3b3ad10ac4cb1a936b6cb8328b2532')

package(){
        # Extract package data
        tar -xI unzstd -f data.tar.zst -C "${pkgdir}"

        mkdir ${pkgdir}/usr/share/perl5/vendor_perl/
        mv ${pkgdir}/usr/share/perl5/KasmVNC ${pkgdir}/usr/share/perl5/vendor_perl/KasmVNC

        ln -s ${pkgdir}/usr/bin/kasmvncserver ${pkgdir}/usr/bin/vncserver
        ln -s ${pkgdir}/usr/bin/kasmvncpasswd ${pkgdir}/usr/bin/vncpasswd
        ln -s ${pkgdir}/usr/bin/kasmvncconfig ${pkgdir}/usr/bin/vncconfig
        ln -s ${pkgdir}/usr/bin/Xkasmvnc ${pkgdir}/usr/bin/Xvnc
        ln -s ${pkgdir}/usr/bin/kasmxproxy ${pkgdir}/usr/bin/xproxy
}
