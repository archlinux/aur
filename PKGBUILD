# Maintainer: Nathaniel Chin <thegamingorangutans+aur at gmail.com>
# Original: bitwave > https://aur.archlinux.org/packages/python-scenedetect/

pkgname=('python-scenedetect-git')
pkgver=v0.5.3.r3.g6d4a42a
pkgrel=1
pkgdesc="A cross-platform, OpenCV-based video scene detection program and Python library."
url="https://github.com/Breakthrough/PySceneDetect"
depends=('python' 'python-click' 'opencv' 'python-numpy')
makedepends=('python-setuptools' 'git')
optdepends=('python-tqdm: Progress bar and estimated time.'
            'mkvtoolnix-cli: Splitting in copy mode.'
            'ffmpeg: Splitting in precise mode.')
license=('BSD')
arch=('any')
provides=('python-scenedetect')
conflicts=('python-scenedetect')
source=("git+https://github.com/Breakthrough/PySceneDetect.git"
        'LICENSE')
sha256sums=('SKIP'
            'c6c20f040d5c41680f2584dc01c723494f08234259852c279e3e9018fac8dc71')

pkgver() {
  cd "PySceneDetect"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$srcdir/PySceneDetect"
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    python setup.py install --root="${pkgdir}/" --optimize=1
}