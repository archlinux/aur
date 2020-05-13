# Maintainer: Nathaniel Chin <thegamingorangutans+aur at gmail.com>

pkgname=python-av1an-git
pkgver=1.9.r1.g3541002
pkgrel=1
pkgdesc='A cross-platform all-in-one tool for streamlining AV1 encoding'
arch=('any')
url='https://github.com/master-of-zen/Av1an'
license=('MIT')
makedepends=('python-setuptools' 'git')
depends=('python>=3.6.0' 'python-numpy' 'python-scenedetect' 'opencv'
         'python-tqdm' 'python-psutil' 'python-scipy' 'python-matplotlib'
         'ffmpeg')
optdepends=('aom: AOMENC encoder support'
            'svt-av1: SVT-AV1 encoder support'
            'rav1e: rav1e encoder support'
            'libvpx: vpx encoder support')
provides=('python-av1an')
conflicts=('python-av1an')
source=("git+https://github.com/master-of-zen/Av1an.git")
sha256sums=('SKIP')

pkgver() {
  cd "Av1an"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "${srcdir}/Av1an"
    python setup.py install --root="${pkgdir}/" --optimize=1
}
