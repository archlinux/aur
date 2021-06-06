# Maintainer: SheepKid12 <lnqnzh0g at anonaddy dot me>

pkgname=obs-studio-browser-bin
pkgver=27.0.0
pkgrel=1
pkgdesc="Free and open source software for video recording and live streaming. Pre-built with browser, vst plugins."
arch=('x86_64')
license=('GPL2')
url="https://obsproject.com"
provides=('obs-studio')
conflicts=('obs-studio' 'obs-studio-browser')
depends=('ffmpeg' 'jansson' 'libxinerama' 'libxkbcommon-x11' 'mbedtls'
         'qt5-svg' 'qt5-x11extras' 'curl' 'jack' 'gtk-update-icon-cache')
optdepends=('libfdk-aac: FDK AAC codec support'
            'libxcomposite: XComposite capture support'
            'libva-intel-driver: hardware encoding'
            'libva-mesa-driver: hardware encoding'
            'luajit: scripting support'
            'pipewire: obs-plugins'
            'python: scripting support'
            'sndio: obs-plugins'
            'v4l2loopback-dkms: virtual camera support'
            'vlc: VLC Media Source support')
source=("http://ppa.launchpad.net/obsproject/obs-studio/ubuntu/pool/main/o/obs-studio/obs-studio_${pkgver}-0obsproject1~hirsute_amd64.deb")
sha256sums=('53d3bdd44125b3db46164d5ba0a358bed4987e688c4ae1b51a872aab776e4078')

prepare() {
    cd ${srcdir}

    mkdir -p ${pkgname}
    tar -xJf data.tar.xz -C ${pkgname}

    chmod 755 $(find ${pkgname} -type d)
}

package() {
	cd ${srcdir}

	cp -a ${pkgname}/. ${pkgdir}
}
 
