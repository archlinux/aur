# Maintainer: Alex Wicks <alex@awicks.io> (https://aur.archlinux.org/account/aw1cks)
pkgname='python-configize'
_name='Configize'
pkgver=1.0.1
pkgrel=0
pkgdesc='Load YAML configuration respecting XDG'
arch=(any)
url="https://gitlab.com/aw1cks/${pkgname}"
license=('AGPL3')
groups=()
depends=(
  'python>=3.6'
  'python-xdg'
  'python-yaml'
)
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-$pkgver.tar.gz")
sha256sums=('80e0961540153c6ac76b3e56f18e6955882ac5b7296f69e0c76bc2e0289b8317')

build() {
  cd "${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_name}-${pkgver}"
  export PYTHONHASHSEED=0
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
