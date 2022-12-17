# Contributor: twa022 <twa022 at gmail dot com>

pkgname=python-system_hotkey
epoch=1
pkgver=1.0.5
pkgrel=1
pkgdesc="Python library for system wide hotkeys"
arch=('any')
#url="https://github.com/timeyyy/system_hotkey"
url="https://github.com/hhannine/system_hotkey310"
license=('BSD')
depends=('python-xcffib')
makedepends=('python-setuptools')
_commit='c0ee3549d5a1c66dee90ec669c95c4c0a81ab050'
source=("${pkgname}::git+${url}#commit=${_commit}"
        'rename_without_310.patch')
sha256sums=('SKIP'
            '4bc354ad56f76ebbaf49111eea73080e1133eff42f2484b521be5c73a01bbad2')

prepare() {
  cd "${srcdir}/${pkgname}"
  patch -Np2 -r- -i ../rename_without_310.patch
}

package() {
  cd "${srcdir}/${pkgname}"
  python setup.py install --root="${pkgdir}"
}
