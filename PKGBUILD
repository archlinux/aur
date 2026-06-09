# Maintainer: windx-foobar <bezalkogolnycoder at gmail dot com>

pkgname='goto-ssh-bin'
pkgver=1.6.1
pkgrel=1
pkgdesc='A simple terminal SSH manager that provides you with an easy access to the list of your favorite SSH servers.'
arch=('x86_64')
license=('MIT')
url='https://github.com/grafviktor/goto'
source=("https://github.com/grafviktor/goto/releases/download/v${pkgver%b*}/goto_${pkgver%b*}_linux_amd64.tar.gz"
  "https://raw.githubusercontent.com/grafviktor/goto/refs/heads/develop/LICENSE")
b2sums=('2397043207abf6a60dedcf12c6efcee6404a87f15a6e35ca34e45c543ec0a8d8607100541ae85cd2862cf62edd548cd8ac209f1f31774c5e88774c386818a930'
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
