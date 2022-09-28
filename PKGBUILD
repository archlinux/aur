# Maintainer: -=De/\/=-
# Author: Ezequiel
# Contributor: Ezequiel
pkgname=cadzinho
pkgver=0.2.0
pkgrel=7
pkgdesc="Minimalist computer aided design (CAD) software"
arch=('x86_64')
url='https://github.com/zecruel/CadZinho'
license=('MIT')

depends=('sdl2' 'lua')

source=('https://github.com/zecruel/CadZinho/releases/download/0.2.0/linux.zip'
        'cadzinho.png'
        'cadzinho.desktop')

prepare() {
    cd ${srcdir}
    chmod +x CadZinho-x86_64.AppImage
    ./CadZinho-x86_64.AppImage --appimage-extract
}


package() {
    cd ${srcdir}
    install -D -m644 cadzinho.png ${pkgdir}/opt/cadzinho/cadzinho.png
    install -D -m644 cadzinho.desktop ${pkgdir}/usr/share/applications/cadzinho.desktop
    install -d -m644  ${pkgdir}/opt/cadzinho
    cp -r $srcdir/squashfs-root/* ${pkgdir}/opt/cadzinho
    chmod a+x ${pkgdir}/opt/cadzinho/AppRun
}

sha256sums=('3c751b0c49bf5afc2465e58dc4303d22fdcfe3b0f4f90cbbb1e84c5b5cee92bf'
            '103e5df8fac52c36a5245cb0fbb6208881fc4d9cf7a4faaced74a6c5f62b4e2d'
            'b97e9c4da9fca86e3171f7ed662934363d33dab49ff8f83ec326b8f366e4fc63')
