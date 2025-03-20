# Maintainer: Ben Song <bensongsyz@gmail.com>
pkgname=python-iostat-tool
_name=${pkgname#python-}
pkgver=0.3.1
pkgrel=1
pkgdesc='parse and visualize iostat output'
url='https://github.com/t2y/iostat-tool'
arch=('any')
license=('Apache-2.0')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('6168387d05ab8c20f17a9ed9994052e83481a24c8c819d447813dfba4a96b6ed')
depends=('python' 'python-matplotlib')
#optdepends=('rofi: provide for a few utility scripts')
makedepends=('python-setuptools' 'git')
#conflicts=("i3-workspace-groups")
#provides=('i3-workspace-groups')

build() {
    cd "$srcdir/${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

