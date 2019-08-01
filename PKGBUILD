# Maintainer: Thomas Queiroz <thomasqueirozb@gmail.com>

_gitname=FOX-cursor
pkgname=fox-cursor-git
pkgver=r3.5b361d2
pkgrel=1
pkgdesc='Glowing mouse cursor theme with red, green, blue and yellow colors'
arch=(any)
makedepends=('git' 'unzip')
url="https://github.com/novamax2001/${_gitname}"
license=('GPL3')
source=("git+${url}.git")
md5sums=('SKIP')

pkgver(){
    cd ${_gitname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -d -m 755 "$pkgdir"/usr/share/icons/FOXcursorB
    install -d -m 755 "$pkgdir"/usr/share/icons/FOXcursorG
    install -d -m 755 "$pkgdir"/usr/share/icons/FOXcursorR
    install -d -m 755 "$pkgdir"/usr/share/icons/FOXcursorY

    cd $srcdir/${_gitname}/
    unzip "FOX cursor  B.zip" -d FOXcursorB
    unzip "FOX cursor  G.zip" -d FOXcursorG
    unzip "FOX cursor R.zip"  -d FOXcursorR
    unzip "FOX cursor  Y.zip" -d FOXcursorY

    cp -r FOXcursorB/*/* "$pkgdir"/usr/share/icons/FOXcursorB/
    cp -r FOXcursorG/*/* "$pkgdir"/usr/share/icons/FOXcursorG/
    cp -r FOXcursorR/*/* "$pkgdir"/usr/share/icons/FOXcursorR/
    cp -r FOXcursorY/*/* "$pkgdir"/usr/share/icons/FOXcursorY/
}
