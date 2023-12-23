# Maintainer: Tiramisu <tiramisu dismail de>

pkgname=upscaler-hollowaykeanho
pkgver=0.7.0
pkgrel=1
pkgdesc="A consolidation of various compiled open-source AI image/video upscaling product for a working CLI friendly image and video upscaling program."
arch=('any')
url="https://github.com/hollowaykeanho/Upscaler"
license=('BSD-3')
source=("https://github.com/hollowaykeanho/Upscaler/releases/download/0.7.0/upscaler-v0.7.0.zip")
sha256sums=('2426a371401b749d671024e1411b935c8310af324c76eab71548869f4f947cd9')

package() {
    cd $srcdir/upscaler
    rm -v bin/windows-amd64.exe
    rm -v bin/mac-amd64
    rm -v init/windows.ps1
    mkdir -vp $pkgdir/usr/share/upscaler
    cp -rv * $pkgdir/usr/share/upscaler
    mkdir -vp $pkgdir/usr/bin/
    cat << EOF > $pkgdir/usr/bin/upscaler
#!/bin/sh
/usr/share/upscaler/start.cmd "\$@"
EOF
    chmod +x $pkgdir/usr/bin/upscaler
}
