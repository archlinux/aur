# Maintainer: Major <majorx234@googlemail.com>
pkgname=python-inputs
_gitname=inputs
pkgver=0.1.0
pkgrel=1
pkgdesc="Cross-platform Python support for keyboards, mice and gamepads"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/zeth/inputs"
licens="BSD 3"
depends=('python' 'python-setuptools')
makedepends=('git')
source=("${_dir}"::"git+https://github.com/zeth/inputs.git")
sha256sums=('SKIP')

package() {

  cd "$srcdir"/$_gitname
  python setup.py install --root "$pkgdir"
  # Install LICENSE file
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
  # Install README file
  install -Dm644 README "${pkgdir}/usr/share/${pkgname}/README"
}
