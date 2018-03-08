# Maintainer: Jesse Bryan <jesse@winneon.moe>
pkgname=nototools-git
pkgver=20180305.d97df1a
pkgrel=1
pkgdesc="Noto fonts support tools and scripts plus web site generation"
arch=("x86_64")
license=("MIT")
depends=(
    # official repositories:
        "python2" "python2-fonttools" "python2-pillow" "cairo" "pango" "pygtk" "imagemagick"
    # AUR:
        "python2-booleanoperations" "python2-defcon" "python2-pyclipper" "python2-ufolib"
)
source=("${pkgname}"::"git+https://github.com/googlei18n/nototools.git")
sha256sums=("SKIP")

pkgver() {
    cd "${pkgname}/"
    git log -1 --format="%cd.%h" --date=short | tr -d -
}

package() {
    cd "${pkgname}/"
    python2 setup.py install --root="${pkgdir}/"
}
