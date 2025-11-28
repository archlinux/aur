# Maintainer: windx-foobar <bezalkogolnycoder at gmail dot com>

pkgname='goto-ssh-bin'
pkgver=1.5.0
pkgrel=1
pkgdesc='A simple terminal SSH manager that provides you with an easy access to the list of your favorite SSH servers.'
arch=('any')
license=('MIT')
url='https://github.com/grafviktor/goto'
source=("https://github.com/grafviktor/goto/releases/download/v${pkgver%b*}/goto-v${pkgver%b*}.zip"
  "https://raw.githubusercontent.com/grafviktor/goto/refs/heads/develop/LICENSE")
b2sums=('64fe7e35bfdad963529a19d8cf4dbc899b62e484af6dd3e660112be6639f68e75ca8a0e8270e173525f0a2bd3da9cc8f5f419fa4ecb25e31faecea68f3ec8ee1'
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
