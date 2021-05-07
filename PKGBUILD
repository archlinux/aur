# Maintainer: Tobias Bachmann <tobachmann@gmx.de>
pkgname=fsleyes
pkgver=1.0.5
pkgrel=1
pkgdesc="FSLeyes is the FSL image viewer"
arch=('any')
url="https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/FSLeyes"
license=('Apache')
groups=()
depends=('python' 'python-setuptools' 'python-sphinx' 'python-six' 'python-numpy' 'python-matplotlib' 'python-nibabel' 'python-jinja' 'python-opengl' 'python-pyparsing' 'python-pillow' 'python-scipy' 'python-opengl-accelerate' 'python-wheel' 'python-twine' 'python-pytest-timeout' 'python-pytest-xdist' 'python-certifi' 'python-wxpython>=4.0.1-2' 'python-xarray' 'python-parse' 'fslpy>=3.6.0' 'fsleyes-widgets>=0.12.1' 'fsleyes-props>=1.7.3' 'python-file-tree>=0.3.5')
optdepends=('fsl: Enable loading standard images and advanced features (highly recommended)'
            'python-wxnatpy: Enable loading overlay from XNAT'
            'python-indexed-gzip: Fast random access of gzipped image files'
            'python-rtree')
makedepends=()
provides=()
conflicts=()
replaces=()
source=("https://git.fmrib.ox.ac.uk/fsl/${pkgname}/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}.desktop")
sha256sums=('31a0d31941968c5f71315a4d9491fa0f17ae83863a095aa355c33aecf469c156'
            '6e91e88eb74602f8da7cda6575245dbaaf4577022bffe15c0efedb33106139fb')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  python setup.py install --root="${pkgdir}/" --optimize=1
  
  install -Dm644 ./fsleyes/assets/icons/app_icon/fsleyes.iconset/icon_512x512.png "${pkgdir}"/usr/share/icons/hicolor/512x512/apps/${pkgname}.png
  install -Dm644 "${srcdir}"/${pkgname}.desktop "${pkgdir}"/usr/share/applications/${pkgname}.desktop
}
