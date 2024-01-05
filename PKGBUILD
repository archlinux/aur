# Maintainer: dario loi <dario13 loi at gmail dot com>
pkgname=staplegl-git
pkgver=v0.10.0
pkgrel=1
pkgdesc="Header-only C++20 OpenGL wrapper"
arch=('any')
url="https://github.com/dario-loi/staplegl"
license=('MIT')
source=("https://github.com/dario-loi/staplegl.git")
md5sums=('SKIP')
optdepends=('glfw: to compile the examples'
            'tbb: for the multithreading in the batches example'
            'cmake: to compile the examples'
            'doxygen: to generate the documentation locally')


package() {
    cd "$srcdir"
    git clone --branch=${pkgver} https://github.com/dario-loi/staplegl.git
    cd "staplegl"
    
    # Copy the include files and modules to the appropriate destination
    install -d "${pkgdir}/usr/include/"
    install -d "${pkgdir}/usr/include/modules"
    cp -r "include/"* "${pkgdir}/usr/include/${pkgname}"
    cp -r "include/modules/"* "${pkgdir}/usr/include/${pkgname}/modules/"
    
    # Install the LICENSE file
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

