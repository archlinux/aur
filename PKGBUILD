# Maintainer: Alan Jenkins <alan.james.jenkins@gmail.com>

pkgname=nbtexplorer
pkgver=2.7.6
pkgrel=2
pkgdesc="Minecraft NBT Editor for editing player and world files."
arch=('i686' 'x86_64')
url="https://github.com/jaquadro/NBTExplorer"
license=('unknown')
depends=('mono' 'xorg-server-utils' 'unzip')
provides=('nbtexplorer')

source=(https://github.com/jaquadro/NBTExplorer/releases/download/v{$pkgver}.-win/NBTExplorer-${pkgver}.zip nbtexplorer nbtexplorer.png nbtexplorer.desktop)

md5sums=( '202c63befd60d0d347120a60428abdd0'
          '49ae5eca65fe9ee7f546e7f518e98621'
          'ae0ef756dcb6f660e245a8b6bdc381d3'
          '62170849669e8c833c5929070eadd0f7' )

package() {
    cd "$srcdir"
    unzip -o NBTExplorer-$pkgver.zip
    install -D -m555 "${srcdir}/nbtexplorer"             "${pkgdir}/usr/bin/nbtexplorer"
    install -D -m444 "${srcdir}/NBTExplorer.exe"         "${pkgdir}/usr/share/nbtexplorer/NBTExplorer.exe"
    install -D -m444 "${srcdir}/NBTExplorer.exe.config"  "${pkgdir}/usr/share/nbtexplorer/NBTExplorer.exe.config"
    install -D -m444 "${srcdir}/Substrate.dll"           "${pkgdir}/usr/share/nbtexplorer/Substrate.dll"
    install -D -m444 "${srcdir}/NBTModel.dll"           "${pkgdir}/usr/share/nbtexplorer/NBTModel.dll"

    # Desktop launcher with icon
    install -D -m444 "${srcdir}/nbtexplorer.desktop"     "${pkgdir}/usr/share/applications/nbtexplorer.desktop"
    install -D -m444 "${srcdir}/nbtexplorer.png"         "${pkgdir}/usr/share/pixmaps/nbtexplorer.png"

    # License
    #install -D -m644 "${srcdir}/LICENSE"           "${pkgdir}/usr/share/licenses/atlauncher/LICENSE"
}

# vim:set ts=4 sw=4 et:
