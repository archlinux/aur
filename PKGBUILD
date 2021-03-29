# Maintainer: Nathaniel Chin <thegamingorangutans+aur at gmail.com>
# Contributor: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)

pkgname=python-plotbitrate-git
pkgver=1.0.7.1.r1.g5a5665b
pkgrel=2
pkgdesc="a script for plotting the bitrate of an audio or video stream over time"
arch=('any')
url="https://github.com/zeroepoch/plotbitrate"
license=('BSD')
depends=('python-matplotlib' 'python-pyqt5' 'ffmpeg')
makedepends=('git' 'python-setuptools')
source=("git+https://github.com/zeroepoch/plotbitrate.git")
md5sums=('SKIP')
provides=('plotbitrate-git')
conflicts=('plotbitrate-git')

pkgver() {
  cd "plotbitrate"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/plotbitrate"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
