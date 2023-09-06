# Maintainer: 0ddfactory <parker@0ddfactory.com>

_pkgname=nautilus-emblems
pkgname=${_pkgname}
pkgver=1.0.0
pkgrel=1
pkgdesc="A visual file marking/progress tracking extension for Nautilus (GTK-4)."
arch=('any')
url="https://github.com/0ddfactory/nautilus-emblems"
license=('GPL3')
makedepends=('git')
depends=('python-nautilus' 'nautilus')
source=("${_pkgname}"::git+https://github.com/0ddfactory/nautilus-emblems)
sha256sums=('SKIP')

build() {
    cd "${_pkgname}"
    sed -i 's/folder_i18n/nautilus-emblems/' ./po/POTFILES.in
    sed -i 's/folder_path/nautilus-extension/' ./po/POTFILES.in
    sed -i 's/folder_i18n/nautilus-emblems/' ./nautilus-extension/nautilus-emblems.py
}

package() {
    cd "${_pkgname}"
    install -d "$pkgdir"/usr/share/nautilus-python/extensions/
    cp ./nautilus-extension/nautilus-emblems.py "$pkgdir"/usr/share/nautilus-python/extensions/
}
