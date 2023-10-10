# Maintainer: dario loi <dario13 loi at gmail dot com>
pkgname=staplegl-git
pkgver=v0.9.3
pkgrel=1
pkgdesc="Header-only C++20 OpenGL wrapper"
arch=('any')
url="https://github.com/dario-loi/staplegl"
license=('MIT')
source=("https://github.com/dario-loi/staplegl.git")
md5sums=('SKIP')
optdepends=('glfw: to compile the examples', 'tbb: for the multithreading in the batches example')

package() {
    # Extract the source code
    cd "$srcdir"
    git clone --branch=${pkgver} https://github.com/dario-loi/staplegl.git
    
    printf "Building StapleGL...\n"
    
    # Copy the include files and modules to the appropriate destination
    install -d "${pkgdir}/staplegl/usr/include/"
    install -d "${pkgdir}/staplegl/usr/include/modules"
    cp -r "staplegl/include/"* "${pkgdir}/staplegl/usr/include/"
    cp -r "staplegl/include/modules/"* "${pkgdir}/staplegl/usr/include/modules/"
    
    # Install the LICENSE file
    install -Dm644 "staplegl/LICENSE" "${pkgdir}/staplegl/usr/share/licenses/${pkgname}/LICENSE"
}


