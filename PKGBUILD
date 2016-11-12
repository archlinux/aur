# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
pkgname=kashmir
pkgver=20150805
pkgrel=1
pkgdesc="A header-only library intended to provide functionality needed in many software projects, but not present in the C++ standard library"
arch=('any')
makedepends=('git')
url="https://github.com/Corvusoft/kashmir-dependency"
license=('custom:boost')
source=("kashmir::git://github.com/Corvusoft/kashmir-dependency#commit=2f3913f49c4ac7f9bff9224db5178f6f8f0ff3ee")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd "${pkgname}"

  install -D -m644 LICENSE_1_0.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE_1_0.txt"
  install -d -m755 "${pkgdir}/usr/include/${pkgname}/"
  cp -r "kashmir" "${pkgdir}/usr/include/"
}

# vim:set ts=2 sw=2 et:
