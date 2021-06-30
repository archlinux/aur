# Maintainer: Alex Wicks <alex@awicks.io> (https://aur.archlinux.org/account/aw1cks)
pkgname=pyslam
_name=PySLAM
pkgver=1.2.0
pkgrel=0
pkgdesc="Python implementation of Source Live Audio Mixer"
arch=(any)
url="https://gitlab.com/aw1cks/${pkgname}"
license=('AGPL3')
groups=()
depends=(
  'dmenu'
  'ffmpeg'
  'fzf'
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
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-$pkgver.tar.gz")
sha256sums=("590939b51b106c3b1a916da030d677491eb546a4a331e1c5208b44bc83756f18")

build() {
  cd "${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_name}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
