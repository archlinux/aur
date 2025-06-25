# Maintainer: windx-foobar <bezalkogolnycoder at gmail dot com>

pkgname='goto-ssh-bin'
pkgver=1.4.1
pkgrel=1
pkgdesc='A simple terminal SSH manager that provides you with an easy access to the list of your favorite SSH servers.'
arch=('any')
license=('MIT')
url='https://github.com/grafviktor/goto'
source=("https://github.com/grafviktor/goto/releases/download/v${pkgver%b*}/goto-v${pkgver%b*}.zip"
  "https://raw.githubusercontent.com/grafviktor/goto/refs/heads/develop/LICENSE")
b2sums=('772413939ed8ded61c552fc9739894391bacc4a4e3e633d4cd7306726f9387529bad8c549870b538ff1b4079139734d47d3d151d8f40ba5b2cfef56ac76983c6'
  '5727b772a1c4851aabc85e184cbb043e555e7db727b8183aefba4082772b8ffad71748bf0709ea9d32933a8dc0db9a44ddeebf6b6ee5b5a65bb432ca61a57cd5')
provides=('goto-ssh-bin' 'gg-ssh-bin')

package() {
  depends=('openssh')

  _pkgname="${pkgname/-bin/''}"
  _pkgname_link="${_pkgname/goto/'gg'}"

  install -Dm755 "${srcdir}"/goto-v${pkgver%b*}/gg-lin "${pkgdir}"/usr/bin/${_pkgname}
  ln -s /usr/bin/${_pkgname} "${pkgdir}"/usr/bin/${_pkgname_link}

  install -Dm644 "${srcdir}"/LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.txt
}
