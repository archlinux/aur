# Maintainer: solnce <echo c29sbmNlQHJhdGFqY3phay5vbmU= | base64 -d>
pkgname=pacdef-bin
_pkgname=pacdef
pkgver=1.5.0
pkgrel=1
pkgdesc='multi-backend declarative package manager for Linux, binary version'
url='https://github.com/steven-omaha/pacdef'
source=("https://github.com/steven-omaha/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-arch.tar.gz")
arch=('x86_64')
license=('GPL3')
depends=('gcc-libs')
conflicts=('pacdef-git' 'pacdef')
provides=('pacdef')
sha256sums=('361ad3bcf0fae6eac3577714895cacc3904117e8c986fe9ca8d711264742e0d5')

package() {
  cd "${srcdir}/${_pkgname}-arch"
  install -Dm755 pacdef "${pkgdir}/usr/bin/pacdef"
# install -Dm644 _completion.zsh "${pkgdir}/usr/share/zsh/site-functions/_pacdef"

  install -Dm644 man/pacdef.8 "${pkgdir}/usr/share/man/man8/pacdef.8"
  install -Dm644 man/pacdef.yaml.5 "${pkgdir}/usr/share/man/man5/pacdef.yaml.5"
}
