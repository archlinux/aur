# Maintainer: Nathaniel Chin <thegamingorangutans+aur at gmail.com>
# Contributor: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)

pkgname=plotbitrate-git
pkgver=1.1.1.0.r1.g59a12ab
pkgrel=1
pkgdesc="a script for plotting the bitrate of an audio or video stream over time"
arch=('any')
url="https://github.com/zeroepoch/plotbitrate"
license=('BSD')
depends=('python-matplotlib' 'python-pyqt6' 'ffmpeg')
makedepends=('git' 'python-setuptools')
source=("git+https://github.com/zeroepoch/plotbitrate.git")
md5sums=('SKIP')
provides=('python-plotbitrate-git')
conflicts=('python-plotbitrate-git')

pkgver() {
  cd "plotbitrate"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/plotbitrate"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
