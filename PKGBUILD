# Maintainer: windx-foobar <bezalkogolnycoder at gmail dot com>

pkgname='goto-ssh-bin'
pkgver=1.6.0
pkgrel=1
pkgdesc='A simple terminal SSH manager that provides you with an easy access to the list of your favorite SSH servers.'
arch=('x86_64')
license=('MIT')
url='https://github.com/grafviktor/goto'
source=("https://github.com/grafviktor/goto/releases/download/v${pkgver%b*}/goto_${pkgver%b*}_linux_amd64.tar.gz"
  "https://raw.githubusercontent.com/grafviktor/goto/refs/heads/develop/LICENSE")
b2sums=('f619cfeb907513be10535aacbfcdec41cc87fd539ae58ea7e460cadb90c8638a799d6c81423ed21ebd1275c96fc64cbd92fe07e235a6cebcb74c39ab0b613db9'
  '5727b772a1c4851aabc85e184cbb043e555e7db727b8183aefba4082772b8ffad71748bf0709ea9d32933a8dc0db9a44ddeebf6b6ee5b5a65bb432ca61a57cd5')
provides=('goto-ssh-bin' 'gg-ssh-bin')

package() {
  depends=('openssh')

  _pkgname="${pkgname/-bin/''}"
  _pkgname_link="${_pkgname/goto/'gg'}"

  install -Dm755 "${srcdir}"/gg "${pkgdir}"/usr/bin/${_pkgname}
  ln -s /usr/bin/${_pkgname} "${pkgdir}"/usr/bin/${_pkgname_link}

  install -Dm644 "${srcdir}"/LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.txt
}
