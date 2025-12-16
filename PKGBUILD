# Maintainer: Zorbatron <46525467+Zorbatron@users.noreply.github.com>

pkgname=tdns-bin
_pkgname=tdns
pkgver=0.5.4
pkgrel=1

pkgdesc="A powerful, lightweight CLI to manage Technitium DNS server via HTTP API endpoint"
arch=('x86_64')
url='https://github.com/mbevc1/tdns'
license=('MPL-2.0')
provides=('tdns')
conflicts=('tdns')
source=("${url}/releases/download/v${pkgver}/tdns_${pkgver}_linux_amd64.tar.gz" "tdns-LICENSE::https://raw.githubusercontent.com/mbevc1/tdns/refs/tags/v${pkgver}/LICENSE")
sha256sums=('b3262aa0479c54cd1a6a562a31661acff3b723ddc85f00da521967aa4150a147' '1f256ecad192880510e84ad60474eab7589218784b9a50bc7ceee34c2b91f1d5')

package() {
  install -Dm 755 tdns -t "${pkgdir}/usr/bin/"
  install -Dm 644 tdns-LICENSE -T "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  ./tdns completion bash 2> /dev/null > tdns.bash
  install -Dm 644 tdns.bash -T "${pkgdir}/usr/share/bash-completion/completions/tdns"

  ./tdns completion zsh 2> /dev/null > tdns.zsh
  install -Dm 644 tdns.zsh -T "${pkgdir}/usr/share/zsh/site-functions/_tdns"
  
  ./tdns completion fish 2> /dev/null > tdns.fish
  install -Dm 644 tdns.fish -t "${pkgdir}/usr/share/fish/vendor_completions.d/"
}

# vim:set ts=2 sw=2 et
