# Maintainer: Joost Bremmer <toost dot b at gmail dot com>
pkgname=clmystery-git
pkgver=20150115
pkgrel=1
pkgdesc="A command-line murder mystery"
arch=('any')
license=('MIT')
url="https://github.com/veltman/clmystery"
makedepends=('git')
options=()
install=
source=('git+https://github.com/veltman/clmystery.git')
md5sums=('SKIP')


pkgver() 
{
  cd "${srcdir}/${pkgname%-git}"
  git log -1 --format="%cd" --date=short | sed 's/-//g'

}

package() {
  cd "${srcdir}"

  find ${pkgname%-git} -type f -perm 644 -and -not -iname "LICENSE.md" -and \( ! -regex '.*/\..*' \) -exec install -Dv -m 644 {,${pkgdir}/opt/}{} \;
  install -Dv -m644 ${pkgname%-git}/LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
