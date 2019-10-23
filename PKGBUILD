pkgname=linvst2
pkgver=2.7.2
pkgver_w2lvst2=2.4
pkgrel=1
pkgdesc="enables Windows vst's to be used as Linux vst's in Linux vst capable DAW's"
arch=('x86_64')
url="https://github.com/osxmidi/LinVst"
depends=('wine' 'python>=3.7')
conflicts=('linvst' 'linvst-stable')
replaces=('linvst' 'linvst-stable')
source=("https://github.com/osxmidi/LinVst/releases/download/2.7/LinVst-64bit-32bit_${pkgver}.deb"
        "https://github.com/usrmusicman/ArchStudioUtils/archive/${pkgver_w2lvst2}.zip")
sha256sums=('SKIP'
            'SKIP')

package() {
    cd "${srcdir}"
    
    ## Unpack Contents
    tar -xzf data.tar.gz
    
    ## Remove GUI Linker Programss
    rm $srcdir/usr/bin/linvstconvert*
    
    ## Copy Files
    cp -r $srcdir/usr $pkgdir/usr
    
    ## Install CLI Linker Program (Python3)
    install -Dm755 $srcdir/ArchStudioUtils-$pkgver/w2lvst2 $pkgdir/usr/bin/w2lvst2
}
