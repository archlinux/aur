# Maintainer: Alex Wicks <alex@awicks.io> (https://aur.archlinux.org/account/aw1cks)
pkgname=pyslam
pkgver=1.1.1
pkgrel=0
pkgdesc="Python implementation of Source Live Audio Mixer"
arch=(any)
url="https://gitlab.com/aw1cks/pyslam"
license=('AGPL3')
groups=()
depends=(
  'ffmpeg'
  'python>=3.6'
  'python-dynmen'
  'python-pydub'
  'python-setuptools'
  'python-yaml'
  'python-traitlets'
  'python-pyxdg'
  'youtube-dl'
)
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-$pkgver.tar.gz")
sha256sums=("4acb21ab53bac191692e8381cb03b7b76f31a443e5fe9452626f8b2daa4e541b")

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
