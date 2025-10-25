# Maintainer: Cody Wyatt Neiman (xangelix) <neiman@cody.to>

pkgname=kasmvncserver-bin
pkgver=1.4.0
pkgrel=1
pkgdesc="KasmVNC provides remote web-based access to a Desktop or application."
arch=('x86_64' 'aarch64')
url="https://github.com/kasmtech/KasmVNC"
license=('GPL2')
depends=('ca-certificates-utils' 'libbsd>=0.7.0' 'libgl' 'libglvnd' 'libjpeg-turbo' 'libunwind' 'libx11>=1.4.99.1' 'libxau>=1.0.9' 'libxcrypt-compat>=4.1.0' 'libxcursor>1.1.2' 'libxdmcp' 'libxext' 'libxfixes' 'libxfont2>=2.0.1' 'libxrandr>=1.2.0' 'libxtst' 'libyaml' 'openssl>=3.0.0.alpha1' 'perl' 'perl-hash-merge-simple' 'perl-list-moreutils' 'perl-switch' 'perl-try-tiny' 'perl-yaml-tiny' 'pixman>=0.30.0' 'systemd-libs' 'xkeyboard-config' 'xorg-xauth' 'xorg-xkbutils' 'zlib' 'perl-datetime' 'freetype2>=2.2.1' 'lib32-mesa' 'libpng>=1.6.2' 'libxshmfence')
backup=('etc/kasmvnc/kasmvnc.yaml')
options=('!strip' '!emptydirs')

source_x86_64=("https://github.com/kasmtech/KasmVNC/releases/download/v${pkgver}/kasmvncserver_focal_${pkgver}_amd64.deb")
source_aarch64=("https://github.com/kasmtech/KasmVNC/releases/download/v${pkgver}/kasmvncserver_focal_${pkgver}_arm64.deb")

sha512sums_x86_64=('0ccdff6010a23d0b4d6230f615494cdffcd0c6da7a45fc8a23b5bef9e90dba0f455fd0dfc5d2860f4e3958edae3b7723dbe2364cfe5b83035b33bf05dbe669c7')
sha512sums_aarch64=('968be143c47fcc23d11dbf72edd796ca24e8d2969a48f2b97a0e88bcaa2293644bedd52a038439b0b3a6959833cf9e02b79300aa6e097bd89116b1882cdd2e96')

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
