# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="c99-meta"
_commit="ee5575511395f270b5a1341d38f84f4c56ba74d4" # r66
pkgver="r66+g${_commit::7}"
pkgrel=1
pkgdesc="Abusing the C99 preprocessor for meta-programming"
arch=('any')
url="https://github.com/twhitehead/${pkgname}"
license=('LGPL-3.0-or-later')
_pkgsrc="${pkgname}-${_commit}"
source=("${_pkgsrc}.tar.gz::${url}/archive/${_commit}.tar.gz")
b2sums=('90e27bb17b40402d1340c6b2ff5d96b7c8fda96f02845da273fb216dd5ed665f53f177ea50e86fcbe81cfdc08a1ac75a1fb424ce1cbbb6622b088e9420c52a45')

# check() {
#   cd "${srcdir}/${_pkgsrc}/Tests"
#   gcc ${CFLAGS} ${LDFLAGS} --std=c99 -E *.c
# }

package() {
  cd "${srcdir}/${_pkgsrc}"
  find . -maxdepth 1 -type f -name "*.h" -exec \
    install -vDm644 "{}" "${pkgdir}/usr/include/${pkgname}/{}" \;

  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
