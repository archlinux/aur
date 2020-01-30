# Contributor: mosra <mosra@centrum.cz modified by nskelsey@gmail.com>

_pkgname=imgui
pkgname=imgui-src
pkgver=1.72
pkgrel=2
pkgdesc="Bloat-free Immediate Mode Graphical User interface for C++ (sources)"
arch=('any')
url="https://github.com/ocornut/imgui"
license=("MIT")
source=("https://github.com/ocornut/${_pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('884fec871560139612cfa62ef6b28efc')

build() {
    true
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"

    install -m755 -d $pkgdir/opt/imgui
    for i in imgui.h imgui_internal.h imconfig.h imstb_textedit.h imstb_rectpack.h imstb_truetype.h imgui.cpp imgui_widgets.cpp imgui_draw.cpp imgui_demo.cpp; do
        install -m644 $i $pkgdir/opt/imgui/$i
    done

    install -m755 -d $pkgdir/opt/imgui/misc/cpp
    for i in imgui_stdlib.h imgui_stdlib.cpp; do
        install -m644 misc/cpp/$i $pkgdir/opt/imgui/misc/cpp/$i
    done
}
