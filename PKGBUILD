# Maintainer:  JakobDev<jakobdev at gmx dot de>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=jdtextedit
pkgver=10.3
pkgrel=1
pkgdesc="An advanced text editor"
arch=("any")
url="https://gitlab.com/JakobDev/jdTextEdit"
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
    "python-setuptools")
makedepends=("python-sphinx" "python-sphinx_rtd_theme")
source=("${pkgname}-${pkgver}.tar.gz::https://gitlab.com/JakobDev/jdTextEdit/-/archive/${pkgver}/jdTextEdit-${pkgver}.tar.gz" "distribution.json")
sha256sums=("471e2268f0e34c1054dd15cf72fbf1ee1bed1bcce90666f068b428911826980e" "c0f33924bce00130cd94a64e65b633f2d633482e648388e91159eac33b712c13")

package() {
    mv distribution.json "jdTextEdit-${pkgver}"
    cd "jdTextEdit-${pkgver}"
    python ./install.py --yes --no-deps --install-manpage --install-html-doc --prefix="${pkgdir}/usr" --distribution-file distribution.json
}
