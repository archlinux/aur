# Maintainer: Tobias Bachmann <tobachmann@gmx.de>
pkgname=fsleyes
pkgver=0.33.1
pkgrel=1
pkgdesc="FSLeyes is the FSL image viewer"
arch=('any')
url="https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/FSLeyes"
license=('Apache')
groups=()
depends=('python' 'python-setuptools' 'python-sphinx' 'python-six' 'python-numpy' 'python-matplotlib' 'python-nibabel' 'python-jinja' 'python-opengl' 'python-pyparsing' 'python-pillow' 'python-scipy' 'python-opengl-accelerate' 'python-pathlib2' 'python-wheel' 'python-twine' 'python-pytest-timeout' 'python-pytest-xdist' 'python-wxpython>=4.0.1-2' 'fslpy>=3.1.0' 'fsleyes-widgets>=0.9.0' 'fsleyes-props>=1.7.0')
optdepends=('fsl: Enable loading standard images and advanced features (highly recommended)'
            'python-wxnatpy: Enable loading overlay from XNAT'
            'python-indexed-gzip: Fast random access of gzipped image files'
            'python-rtree')
makedepends=()
provides=()
conflicts=()
replaces=()
source=("${pkgname}-${pkgver}.tar.gz::https://git.fmrib.ox.ac.uk/fsl/fsleyes/fsleyes/repository/archive.tar.gz?ref=${pkgver}"
        "${pkgname}.png::https://git.fmrib.ox.ac.uk/uploads/-/system/group/avatar/85/icon_512x512.png"
        "${pkgname}.desktop")
sha256sums=('a6b61a95c5a95f01c2d57ccd4daf5f07076fa4f1e6d5a7ca8525429371b90918'
            'c7211ee624483a272f280b3aa772046ec9226d838f9c3023450888abddf9d71a'
            '6e91e88eb74602f8da7cda6575245dbaaf4577022bffe15c0efedb33106139fb')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}-"*
  
  python setup.py install --root="${pkgdir}/" --optimize=1
  
  install -Dm644 "${srcdir}"/${pkgname}.png "${pkgdir}"/usr/share/icons/hicolor/512x512/apps/${pkgname}.png
  install -Dm644 "${srcdir}"/${pkgname}.desktop "${pkgdir}"/usr/share/applications/${pkgname}.desktop
}
