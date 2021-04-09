# Maintainer: Andrea Denisse Gómez-Martínez <aur at denisse dot dev>

pkgname=arpfox-bin
_pkgname=${pkgname%-bin}
pkgver=1.0.0
pkgrel=1
url="https://github.com/malfunkt/arpfox"
pkgdesc='An arpspoof alternative that injects spoofed ARP packets into a LAN.'
arch=(x86_64 i686 armv7h)
license=("MIT")
provides=($_pkgname)
conflicts=($_pkgname)
source=("${url}/releases/download/v${pkgver}/${_pkgname}_linux_amd64.gz"
        "LICENSE::https://raw.githubusercontent.com/malfunkt/arpfox/master/LICENSE")
source_i686=("${url}/releases/download/v${pkgver}/${_pkgname}_linux_386.gz"
             "LICENSE::https://raw.githubusercontent.com/malfunkt/hyperfox/master/LICENSE")
source_armv7h=("${url}/releases/download/v${pkgver}/${_pkgname}_linux_armv7.gz"
               "LICENSE::https://raw.githubusercontent.com/malfunkt/hyperfox/master/LICENSE")
sha256sums=('1da18576e853897cfd369d4b14b996b87f43352bc5d9f2f2c299c5d06f9c1bad'
            'abfbab0511686490ea994857e61789e327b6e00f867d2fb8b3605746d19a8fda')
sha256sums_i686=('60d178f95088a1907704aee4fe9eaa89c61f126c373ce88c649a91227cca5665'
                 'abfbab0511686490ea994857e61789e327b6e00f867d2fb8b3605746d19a8fda')
sha256sums_armv7h=('e777d00f6c96ac4696b2625a5b88b1062982474763467b66389581b72ade9165'
                   'abfbab0511686490ea994857e61789e327b6e00f867d2fb8b3605746d19a8fda')
sha512sums=('811a2546223fe792cf5372ed8e0afc8a630112c0f32ad65554a2574821fd91adf611cef472eadff5b1917f6e41ebc1f921bf57cd9385d5c74e897836da0cd87f'
            'db157b11d60e40c4ad70be9a80b2cf3cf972292867eb4becbb5d027446e12eeb4ff0d87836097b4da4b16ba10a1b7b3d505f406d36f5e457d6766d34d95e5b70')
sha512sums_i686=('851a49224524d2b7ba933dc2e6104ca1fda83985e1869d3d32fc0398aba02e08a7e55189bb091a477cb4e44fbca1d338593674c58b5235a0301c71d1027f74d8'
                 'db157b11d60e40c4ad70be9a80b2cf3cf972292867eb4becbb5d027446e12eeb4ff0d87836097b4da4b16ba10a1b7b3d505f406d36f5e457d6766d34d95e5b70')
sha512sums_armv7h=('9dbc98dc4ae1f488b9e43da5f807a54cc3b829c9ed509a2c1d6ec003e72c1734b15539b6b215be4be379de04a295dcf64cd90e904340edac4d16f8d8b4ea2cbf'
                   'db157b11d60e40c4ad70be9a80b2cf3cf972292867eb4becbb5d027446e12eeb4ff0d87836097b4da4b16ba10a1b7b3d505f406d36f5e457d6766d34d95e5b70')
b2sums=('79586b8592a246ddb9a75752329e94bcc8d8924dcbe2eb2c7bdd1a11981e4ee39abcea86fb7b76e8c54dc8dd0f20d8b5d4b5f63025380f1ed9efbcca8c9b0bb7'
        '627af2ea1c83988fd234535aa8dfa265de69a3923912c734ce71919e8a2f289f41276d96e076dfe05e53e008ab7d11e4ae49e6cf7baba526a871bfc2d2355265')
b2sums_i686=('1ea65cd1051a71acb4f68d4dc98b56b054228f07bae87aff9414095eb5e1aa2286a85ce46816f0d3fcc0ff0949800ab77fc352f1a468cae3af8e23699cd93bb1'
             '627af2ea1c83988fd234535aa8dfa265de69a3923912c734ce71919e8a2f289f41276d96e076dfe05e53e008ab7d11e4ae49e6cf7baba526a871bfc2d2355265')
b2sums_armv7h=('4697bdb86a5f2ed8c44203b39bb0e21133fa30554a8af1967c98e0f71cdcc2c2aed9099bfa1f81a113ccc070acd834ee1ebd8e385d33e7fd8a62034536cd136c'
               '627af2ea1c83988fd234535aa8dfa265de69a3923912c734ce71919e8a2f289f41276d96e076dfe05e53e008ab7d11e4ae49e6cf7baba526a871bfc2d2355265')

prepare() {
  cd "$srcdir"

  if [ -f "arpfox_linux_amd64" ]; then
    mv arpfox_linux_amd64 arpfox
  elif [ -f "arpfox_linux_386" ]; then
    mv arpfox_linux_386 arpfox
  else
    mv arpfox_linux_armv7 arpfox
  fi
}

package() {
  install -Dm755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
