# Maintainer: solnce <echo c29sbmNlQHJhdGFqY3phay5vbmU= | base64 -d>
pkgname=pacdef-bin
_pkgname=pacdef
pkgver=1.6.0
pkgrel=1
pkgdesc='multi-backend declarative package manager for Linux, binary version'
url='https://github.com/steven-omaha/pacdef'
source=("https://github.com/steven-omaha/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-arch.tar.gz")
arch=('x86_64')
license=('GPL3')
depends=('gcc-libs')
conflicts=('pacdef-git' 'pacdef')
provides=('pacdef')
sha256sums=('9d06d50c86f1eeeece61a0814773d498c76a9188d697edcc24999244d47c4b24')

package() {
  cd "${srcdir}/${_pkgname}-arch"
  install -Dm755 pacdef "${pkgdir}/usr/bin/pacdef"
  install -Dm644 _completion.zsh "${pkgdir}/usr/share/zsh/site-functions/_pacdef"

  install -Dm644 man/pacdef.8 "${pkgdir}/usr/share/man/man8/pacdef.8"
  install -Dm644 man/pacdef.yaml.5 "${pkgdir}/usr/share/man/man5/pacdef.yaml.5"
}
