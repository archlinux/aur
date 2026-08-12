# Maintainer: Byeonghoon Yoo <bh322yoo gmail com>
# Contributor: Byeonghoon Yoo <bh322yoo gmail com>

_pkgname=dynamic_workspaces
_commit=a06e723804398d672be74eba0cd4ccee062e1410
pkgname=kwin-scripts-dynamic-workspaces
pkgver=3.2.0
pkgrel=2
pkgdesc='A kwin script that creates and deletes desktops as you move windows on the last one'
arch=('any')
url="https://github.com/maurges/${_pkgname}"
license=('BSD-3-Clause')
depends=('kwin')
source=("https://github.com/maurges/${_pkgname}/archive/${_commit}.tar.gz")
sha256sums=('445146cb84fb00f63ebecfd13f8875c8de161731d74caa26853d27bf577825dc')

package() {
  install -d "${pkgdir}/usr/share/kwin/scripts/${_pkgname}"
  cp -r "${srcdir}"/${_pkgname}-${_commit}/{contents,metadata.json} "${pkgdir}/usr/share/kwin/scripts/${_pkgname}"
  install -Dm644 "${srcdir}/${_pkgname}-${_commit}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
