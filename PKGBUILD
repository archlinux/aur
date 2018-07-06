# Maintainer : Beatussum <echo 'YmVhdHVzc3VtQHByb3Rvbm1haWwuY29tCg==' | base64 -d>


_reponame=USB-Rubber-Ducky
pkgname=ducky-tools
pkgver=2.6.3
pkgrel=4
pkgdesc="Tools for USB Rubber Ducky by hak5darren"
arch=('i686' 'x86_64')
url="https://github.com/hak5darren/${_reponame}"
license=('unknown')
depends=('java-runtime-common' 'dfu-programmer' 'python2' 'perl' 'bash')
provides=('duckencoder' 'ducky-encoder-gui' 'ducky-decode' 'ducky-flasher' 'duckflash' 'duckdump')
conflicts=('duck-encoder')
options=('!strip')
source=("https://github.com/hak5darren/${_reponame}/archive/v${pkgver}.tar.gz"
        "ducky-encoder-gui.desktop"
        "ducky-encoder-gui.svgz"
        "ducky")
sha256sums=('0e8cc19fa90718953a8c6221c75429bc3970fecb6f000fe0b722568b46e966f4'
            'c957fc80baf59ceadf13ce066bbba3f14a143ad3ddd0913ce6af2977966dcc77'
            'f69e0cf911d258d003698a46116486d290e4af90b342c5dcdbb3a55978d792df'
            '046b7d8c57747a026c2c34c0948ca75759e414738ed2240d12b3477c127fa5ed')

            
package() {
    cd $srcdir
    install -Dm755 "ducky" "${pkgdir}/usr/bin/ducky"
    install -Dm644 "ducky-encoder-gui.svgz" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/ducky-encoder-gui.svgz"
    install -Dm755 "ducky-encoder-gui.desktop" "${pkgdir}/usr/share/applications/ducky-encoder-gui.desktop"
    install -d "${pkgdir}/opt"
    cp -r "${_reponame}-${pkgver}" "${pkgdir}/opt/${_reponame}"
}
