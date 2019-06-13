# Maintainer: Sol Bekic <s+aur at s-ol dot nu>

_gitname=pcbmode
_gittag=master
pkgname="python2-${_gitname}"
pkgdesc='circuit board design software with a twist'
pkgver=4.9
pkgrel=1
url="https://pcbmode.com"
license=('MIT')
arch=('any')
depends=('python2' 'python2-lxml' 'inkscape')
makedepends=('git' 'python-setuptools')
source=("${_gitname}::git://github.com/boldport/${_gitname}.git#tag=v${pkgver}")
sha256sums=('SKIP')

package() {
  cd "${_gitname}"
  python2 setup.py install --root="${pkgdir}" --optimize=1

  # License
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_gitname}/LICENSE"
}
