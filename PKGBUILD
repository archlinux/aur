# Maintainer: Emily Marriott (emilylynmarriott@proton.me)

pkgname=seti-astro-suite-pro-bin
_pkgname=seti-astro-suite-pro
pkgver=1.9.1
pkgrel=1
provides=("seti-astro-suite-pro=$pkgver")
pkgdesc='Seti Astro Suite Pro is a comprehensive suite for staking and editing Astrophotography images.'
arch=('x86_64')
url=https://www.setiastro.com/seti-astro-suite-pro
license=('GPLv3')
depends=('python')
options=(!strip)

source_x86_64=("setiastrosuitepro_linux.tar.xz::https://github.com/setiastro/setiastrosuitepro/releases/download/V$pkgver/setiastrosuitepro_linux.tar.xz")
sha256sums_x86_64=('9284b2cf062bdb1416324d1705632973b625e029ef17e76784f3c16f238ea679')

source=("16x16.png"
        "32x32.png"
        "48x48.png"
        "64x64.png"
        "128x128.png"
        "Seti Astro Suite Pro.desktop")
sha256sums=('2c0817d9c2a0ca93809e2529c98ad0c533a2567284c8cc37a699e5341f1b74e5'
            'ba0208c8f3550498065ab3ee6bf803b232f4553790aead7cf80896a9ce80b2c6'
            '41e15136258dfc9af398ac260b838184017d19a79126e46b7cba4b2437c984e7'
            'f94efb65acf0441758e2cea94486617ef4a4f561e4f29c25006fa0aa9b158944'
            '10ca643fd2105a538a65b3abb831db5dba40c0dfd9a42bc203a2fa8740edec6e'
            '26e186f5f7c3177f6adff3dfb78bc6a569704d2e187db336263c2094a49267c2')

package() {
    mkdir -p "$pkgdir"/usr/bin
    mkdir -p "$pkgdir"/usr/share/applications
    
    install -m755 setiastrosuitepro_linux/SetiAstroSuitePro_linux_ubuntu24.04 "$pkgdir"/usr/bin/SetiAstroSuitePro
    install -m644 *.desktop "$pkgdir"/usr/share/applications/

    #Icons
    for i in 16x16 32x32 48x48 64x64 128x128; do
        install -d "$pkgdir"/usr/share/icons/hicolor/$i/apps/
        install $i.png "$pkgdir"/usr/share/icons/hicolor/$i/apps/$_pkgname.png
    done
}


