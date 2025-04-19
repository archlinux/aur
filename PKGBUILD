# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="slackdump"
pkgname="${_pkgname}-bin"
pkgver=3.1.0
pkgrel=1
pkgdesc="Save your private and public Slack messages, threads, files, and users locally"
arch=('aarch64' 'i686' 'x86_64')
url="https://github.com/rusq/${_pkgname}"
license=('GPL-3.0-only')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_arm64.tar.gz")
source_i686=("${_pkgsrc}-i686.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_i386.tar.gz")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_x86_64.tar.gz")
b2sums_aarch64=('32ab3602fa1f6983ebc60c1d255ea4cb604bb10886d8e97fdf0c868943fcf1daef17216114c44a57ede0358e2dd677e27d2609b3099988764d0f7094fbe5a9b3')
b2sums_i686=('cb0e2ae504096e42355e62a2bfd7e8af98cbbf6a9e8ec110a607bbe0c0c4949dae8d8fd4f6f6edd5ffd7160a64a7846dc1ea3c60a99e91fa5269a0d271120fac')
b2sums_x86_64=('4bbffbb2cec30dfde4b8c626a47d998d536c66e5f6ed3708852049aa91325e03d2002578bc379dfb792c6877252eaae401bdae6f36cf138e2c22d18b29a05e1f')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}"   "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"     "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"       "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -vDm644 "${_pkgname}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
}
