# Maintainer:  JakobDev<jakobdev at gmx dot de>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=jdtextedit
pkgver=11.1
pkgrel=1
pkgdesc="An advanced text editor"
arch=("any")
url="https://codeberg.org/JakobDev/jdTextEdit"
license=("GPL3")
depends=("python"
    "python-pyqt6"
    "python-qscintilla-qt6"
    "python-chardet"
    "python-requests"
    "python-cchardet"
    "python-editorconfig"
    "python-charset-normalizer"
    "python-jdtranslationhelper"
    "python-pyenchant"
    "python-lxml")
makedepends=("python-setuptools" "python-pip" "python-wheel" "qt5-tools" "python-sphinx" "python-sphinx_rtd_theme")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/JakobDev/jdTextEdit/archive/${pkgver}.tar.gz" "distribution.json")
sha256sums=("6b58f16dca6d0b2dbfac15b6ed971b6b83c3298520adf43b59dbfbcb658a80a7" "c0f33924bce00130cd94a64e65b633f2d633482e648388e91159eac33b712c13")

package() {
    mv distribution.json "jdtextedit"
    cd "jdtextedit"
    python ./install.py --yes --no-deps --install-manpage --install-html-doc --prefix="${pkgdir}/usr" --distribution-file distribution.json
}
