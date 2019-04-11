# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: desbma

pkgname=r128gain-git
_pkgname=r128gain
pkgver=0.8.0.r2.g6b4de54
pkgrel=1
pkgdesc='Fast audio loudness (ReplayGain / R128) scanner & tagger'
arch=('any')
url="https://github.com/desbma/${pkgname}"
license=('LGPL')
depends=('python' 'python-setuptools' 'python-mutagen' 'python-crcmod' 'ffmpeg')
source=("git+https://github.com/desbma/r128gain.git")
sha512sums=('SKIP')

pkgver() {
    cd "r128gain"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "${srcdir}/${_pkgname}"
    python setup.py install --root="${pkgdir}"
}
