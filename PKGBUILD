# Contributor: Jesse Bryan <jesse@winneon.moe>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=nototools-git
pkgver=20210125.76b29f8
pkgrel=1
pkgdesc="Noto fonts support tools and scripts plus web site generation"
url=https://github.com/googlei18n/nototools
arch=('any')
license=('Apache')
depends=(
    # official repositories:
         'python-fonttools' 'python-pillow' 'cairo' 'pango' 'imagemagick' 'harfbuzz'
    # AUR:
        'python-booleanoperations' 'python-defcon' 'python-pyclipper' 'python-ufolib'
)
source=("${pkgname}"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}/"
  git log -1 --format="%cd.%h" --date=short | tr -d -
}

package() {
  cd "${pkgname}/"
  python setup.py install --root="${pkgdir}/"
}
